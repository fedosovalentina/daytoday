import 'package:daytoday/models.dart';
import 'package:daytoday/seed.dart';
import 'package:daytoday/stats.dart';
import 'package:daytoday/store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final today = DateTime(2026, 11, 16);

  test('the anchor day is Monday 16 November 2026', () {
    expect(today.weekday, DateTime.monday);
    expect(longDate(today), 'Monday 16 November 2026');
    expect(planTitle(today, today), "Today's plan");
    expect(planTitle(DateTime(2026, 11, 19), today), "Thursday's plan");
  });

  test('cards keep the first three letters and the quiet remainder', () {
    expect(HabitLabel.fromName('English').code, 'ENG');
    expect(HabitLabel.fromName('English').rest, '-lish');
    expect(HabitLabel.fromName('Run').code, 'RUN');
    expect(HabitLabel.fromName('Run').rest, isNull);
    expect(HabitLabel.fromName('  ').code, 'ABC');
    expect(HabitLabel.fromName('Чтение').code, 'ЧТЕ');
    expect(HabitLabel.fromName('Чтение').rest, '-ние');
  });

  test('an open today does not break a streak', () {
    final habit = Habit(
      id: 'eng',
      name: 'English',
      tone: HabitTone.mint,
      days: {
        DateTime.monday,
        DateTime.tuesday,
        DateTime.wednesday,
        DateTime.thursday,
      },
    );
    final done = {
      for (final day in [12, 11, 10])
        completionKey('eng', DateTime(2026, 11, day)),
    };
    expect(streak(habit, done, today), 3);
  });

  test('a missed scheduled day ends the streak', () {
    final habit = Habit(
      id: 'water',
      name: 'Water',
      tone: HabitTone.yellow,
      days: {for (var day = 1; day <= 7; day++) day},
    );
    final done = {
      completionKey('water', DateTime(2026, 11, 15)),
      completionKey('water', DateTime(2026, 11, 14)),
    };
    expect(streak(habit, done, today), 2);
  });

  test('a month score counts every planned slot', () {
    final habit = Habit(
      id: 'eng',
      name: 'English',
      tone: HabitTone.mint,
      days: {DateTime.monday, DateTime.thursday},
    );
    final done = {
      completionKey('eng', DateTime(2026, 11, 2)),
      completionKey('eng', DateTime(2026, 11, 5)),
    };
    final score = monthScore([habit], done, today);
    expect(score.planned, 9);
    expect(score.done, 2);
    expect(score.label, '2 of 9');
  });

  test('the first page has a living week and a round-trippable snapshot', () {
    final snap = seed(today);
    final again = HabitSnapshot.decode(snap.encode());
    expect(again.habits.map((habit) => habit.name), [
      'Run',
      'English',
      'Stretch',
      'Reading',
      'Water',
    ]);
    expect(again.done, snap.done);

    Habit habit(String id) => snap.habits.firstWhere((item) => item.id == id);
    expect(dayScore(snap.habits, snap.done, today).label, '0 of 4');
    expect(streak(habit('eng'), snap.done, today), 3);
    expect(streak(habit('water'), snap.done, today), 6);
    expect(streak(habit('run'), snap.done, today), 2);
    expect(streak(habit('rea'), snap.done, today), 2);
  });

  test('checking a habit is written to the repository', () async {
    final repository = MemoryRepository();
    final store = HabitStore(repository: repository, snapshot: seed(today));
    await store.toggle('eng', today);
    expect(store.isDone('eng', today), isTrue);
    expect(
      repository.snapshot!.done.contains(completionKey('eng', today)),
      isTrue,
    );

    await store.toggle('eng', today);
    expect(store.isDone('eng', today), isFalse);
  });
}
