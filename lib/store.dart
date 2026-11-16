import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'copy.dart';
import 'models.dart';
import 'seed.dart';

abstract class HabitRepository {
  Future<HabitSnapshot?> load();
  Future<void> save(HabitSnapshot snapshot);
}

class MemoryRepository implements HabitRepository {
  HabitSnapshot? snapshot;

  @override
  Future<HabitSnapshot?> load() async => snapshot;

  @override
  Future<void> save(HabitSnapshot value) async {
    snapshot = value;
  }
}

class PrefsRepository implements HabitRepository {
  static const key = 'daytoday.snapshot';

  @override
  Future<HabitSnapshot?> load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(key);
    if (raw == null) return null;
    try {
      return HabitSnapshot.decode(raw);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> save(HabitSnapshot snapshot) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, snapshot.encode());
  }
}

class HabitStore extends ChangeNotifier {
  HabitStore({
    required HabitRepository repository,
    required HabitSnapshot snapshot,
  }) : _repository = repository,
       _habits = [...snapshot.habits],
       _done = {...snapshot.done};

  final HabitRepository _repository;
  final List<Habit> _habits;
  final Set<String> _done;

  /// Opens the on-device snapshot. The first launch gets [seed].
  /// A broken save falls back to the seed in memory so the app still opens.
  static Future<HabitStore> open() async {
    final today = DateTime.now();
    final names = deviceCopy();
    HabitSnapshot planted() => seed(
      today,
      run: names.seedRun,
      english: names.seedEnglish,
      stretch: names.seedStretch,
      reading: names.seedReading,
      water: names.seedWater,
    );
    try {
      final repository = PrefsRepository();
      final saved = await repository.load();
      final snapshot = saved ?? planted();
      if (saved == null) await repository.save(snapshot);
      return HabitStore(repository: repository, snapshot: snapshot);
    } catch (_) {
      return HabitStore(repository: MemoryRepository(), snapshot: planted());
    }
  }

  List<Habit> get habits => List.unmodifiable(_habits);

  List<Habit> get active => [
    for (final habit in _habits)
      if (!habit.archived) habit,
  ];

  Set<String> get done => Set.unmodifiable(_done);

  Habit? find(String id) {
    for (final habit in _habits) {
      if (habit.id == id) return habit;
    }
    return null;
  }

  bool isDone(String id, DateTime day) =>
      _done.contains(completionKey(id, day));

  HabitSnapshot get snapshot => HabitSnapshot(habits: _habits, done: _done);

  Future<void> toggle(String id, DateTime day) {
    final key = completionKey(id, day);
    if (!_done.add(key)) _done.remove(key);
    notifyListeners();
    return _repository.save(snapshot);
  }

  Future<void> save(Habit habit) {
    final index = _habits.indexWhere((item) => item.id == habit.id);
    if (index < 0) {
      _habits.add(habit);
    } else {
      _habits[index] = habit;
    }
    notifyListeners();
    return _repository.save(snapshot);
  }

  Future<void> archive(String id) {
    final index = _habits.indexWhere((item) => item.id == id);
    if (index < 0) return Future.value();
    _habits[index] = _habits[index].copyWith(archived: true);
    notifyListeners();
    return _repository.save(snapshot);
  }
}
