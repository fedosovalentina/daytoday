import 'dart:convert';
import 'dart:io';

import 'package:daytoday/l10n/app_localizations.dart';
import 'package:daytoday/models.dart';
import 'package:daytoday/seed.dart';
import 'package:daytoday/stats.dart';
import 'package:daytoday/store.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final today = DateTime(2026, 11, 16);

  test('the anchor day is Monday 16 November 2026', () {
    expect(today.weekday, DateTime.monday);
    expect(today.year, 2026);
    expect(today.month, 11);
    expect(today.day, 16);
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
    final monday = dayScore(snap.habits, snap.done, today);
    expect(monday.done, 0);
    expect(monday.planned, 4);
    expect(streak(habit('eng'), snap.done, today), 3);
    expect(streak(habit('water'), snap.done, today), 6);
    expect(streak(habit('run'), snap.done, today), 2);
    expect(streak(habit('rea'), snap.done, today), 2);
  });

  test('a fresh page uses the phone language for the five names', () {
    final russian = lookupAppLocalizations(const Locale('ru'));
    final snap = seed(
      today,
      english: russian.seedEnglish,
      water: russian.seedWater,
    );
    expect(
      snap.habits.firstWhere((habit) => habit.id == 'eng').name,
      'Английский',
    );
    expect(snap.habits.firstWhere((habit) => habit.id == 'water').name, 'Вода');
    expect(seed(today).habits.map((habit) => habit.name).first, 'Run');
  });

  test('every language file has the english keys', () {
    final english =
        jsonDecode(File('lib/l10n/app_en.arb').readAsStringSync()) as Map;
    final keys = english.keys.where((key) => !'$key'.startsWith('@')).toSet();
    for (final code in [
      'nl',
      'ru',
      'de',
      'fr',
      'es',
      'pt',
      'ar',
      'zh',
      'ko',
      'hi',
      'ja',
    ]) {
      final file =
          jsonDecode(File('lib/l10n/app_$code.arb').readAsStringSync()) as Map;
      final other = file.keys.where((key) => !'$key'.startsWith('@')).toSet();
      expect(other, keys, reason: code);
      expect(file['appTitle'], 'DAY Today Plan');
    }
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
