import 'models.dart';

/// Finished slots over planned slots. The "1 of 5" and "41 of 52" counters.
class Score {
  const Score(this.done, this.planned);

  final int done;
  final int planned;

  String get label => '$done of $planned';
}

Score scoreBetween(
  Iterable<Habit> habits,
  Set<String> done,
  DateTime start,
  DateTime endInclusive,
) {
  final first = dateOnly(start);
  final last = dateOnly(endInclusive);
  var planned = 0;
  var finished = 0;
  for (var day = first; !day.isAfter(last); day = addDays(day, 1)) {
    for (final habit in habits) {
      if (habit.archived || !habit.scheduledOn(day)) continue;
      planned++;
      if (done.contains(completionKey(habit.id, day))) finished++;
    }
  }
  return Score(finished, planned);
}

Score dayScore(Iterable<Habit> habits, Set<String> done, DateTime day) {
  return scoreBetween(habits, done, day, day);
}

Score monthScore(Iterable<Habit> habits, Set<String> done, DateTime month) {
  final start = DateTime(month.year, month.month, 1);
  final end = DateTime(month.year, month.month + 1, 0);
  return scoreBetween(habits, done, start, end);
}

/// Consecutive scheduled days kept, walking backward.
/// An unfinished today does not break the run — the day is still open.
int streak(Habit habit, Set<String> done, DateTime today) {
  var day = dateOnly(today);
  if (habit.scheduledOn(day) && !done.contains(completionKey(habit.id, day))) {
    day = addDays(day, -1);
  }
  var count = 0;
  for (var guard = 0; guard < 366 * 5; guard++) {
    if (habit.scheduledOn(day)) {
      if (!done.contains(completionKey(habit.id, day))) break;
      count++;
    }
    day = addDays(day, -1);
  }
  return count;
}

int daysTotal(Habit habit, Set<String> done) {
  final prefix = '${habit.id}|';
  var count = 0;
  for (final key in done) {
    if (key.startsWith(prefix)) count++;
  }
  return count;
}

List<HabitTone> tonesOn(Iterable<Habit> habits, DateTime day) {
  return [
    for (final habit in habits)
      if (!habit.archived && habit.scheduledOn(day)) habit.tone,
  ];
}
