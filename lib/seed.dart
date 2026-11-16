import 'models.dart';

/// A first page so the notebook is not blank.
/// Recent days are kept, the 9th and 27th are missed, so the rings and
/// streaks have something honest to show.
HabitSnapshot seed(
  DateTime now, {
  String run = 'Run',
  String english = 'English',
  String stretch = 'Stretch',
  String reading = 'Reading',
  String water = 'Water',
}) {
  final today = dateOnly(now);
  final habits = [
    Habit(
      id: 'run',
      name: run,
      tone: HabitTone.peach,
      days: {DateTime.monday, DateTime.wednesday, DateTime.friday},
    ),
    Habit(
      id: 'eng',
      name: english,
      tone: HabitTone.mint,
      days: {
        DateTime.monday,
        DateTime.tuesday,
        DateTime.wednesday,
        DateTime.thursday,
      },
    ),
    Habit(
      id: 'str',
      name: stretch,
      tone: HabitTone.lavender,
      days: {DateTime.wednesday, DateTime.thursday, DateTime.sunday},
    ),
    Habit(
      id: 'rea',
      name: reading,
      tone: HabitTone.blue,
      days: {DateTime.monday, DateTime.wednesday, DateTime.thursday},
    ),
    Habit(
      id: 'water',
      name: water,
      tone: HabitTone.yellow,
      days: {
        DateTime.monday,
        DateTime.tuesday,
        DateTime.wednesday,
        DateTime.thursday,
        DateTime.friday,
        DateTime.saturday,
        DateTime.sunday,
      },
    ),
  ];

  final done = <String>{};
  for (var ago = 1; ago <= 28; ago++) {
    final day = addDays(today, -ago);
    final missed = ago != 1 && day.day % 9 == 0;
    if (missed) continue;
    for (final habit in habits) {
      if (habit.scheduledOn(day)) done.add(completionKey(habit.id, day));
    }
  }
  return HabitSnapshot(habits: habits, done: done);
}
