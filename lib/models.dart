import 'dart:convert';

import 'package:flutter/material.dart';

import 'theme.dart';

/// One pastel from the color row on the new-habit frame.
enum HabitTone {
  pink(AppColors.pink),
  peach(AppColors.peach),
  yellow(AppColors.yellow),
  mint(AppColors.mint),
  aqua(AppColors.aqua),
  blue(AppColors.blue),
  lavender(AppColors.lavender);

  const HabitTone(this.color);
  final Color color;

  static HabitTone byName(String name) {
    for (final tone in values) {
      if (tone.name == name) return tone;
    }
    return peach;
  }
}

/// The big three letters on a card, plus the quiet remainder.
/// "English" becomes ENG and "-lish".
class HabitLabel {
  const HabitLabel(this.code, this.rest);

  final String code;
  final String? rest;

  static const placeholder = HabitLabel('ABC', null);

  static HabitLabel fromName(String name) {
    final trimmed = name.trim();
    if (trimmed.isEmpty) return placeholder;
    final chars = trimmed.runes.map(String.fromCharCode).toList();
    final code = chars.take(3).join().toUpperCase();
    if (chars.length <= 3) return HabitLabel(code, null);
    return HabitLabel(code, '-${chars.skip(3).join().toLowerCase()}');
  }
}

class Habit {
  const Habit({
    required this.id,
    required this.name,
    required this.tone,
    required this.days,
    this.archived = false,
  });

  final String id;
  final String name;
  final HabitTone tone;

  /// [DateTime.monday] … [DateTime.sunday].
  final Set<int> days;
  final bool archived;

  HabitLabel get label => HabitLabel.fromName(name);

  bool scheduledOn(DateTime day) => days.contains(day.weekday);

  Habit copyWith({
    String? name,
    HabitTone? tone,
    Set<int>? days,
    bool? archived,
  }) {
    return Habit(
      id: id,
      name: name ?? this.name,
      tone: tone ?? this.tone,
      days: days ?? this.days,
      archived: archived ?? this.archived,
    );
  }

  Map<String, Object?> toJson() => {
    'id': id,
    'name': name,
    'tone': tone.name,
    'days': (days.toList()..sort()),
    'archived': archived,
  };

  factory Habit.fromJson(Map<String, dynamic> json) {
    final rawDays = json['days'] as List<dynamic>;
    return Habit(
      id: json['id'] as String,
      name: json['name'] as String,
      tone: HabitTone.byName(json['tone'] as String),
      days: rawDays.map((day) => (day as num).toInt()).toSet(),
      archived: json['archived'] as bool? ?? false,
    );
  }
}

bool sameDays(Set<int> a, Set<int> b) =>
    a.length == b.length && a.containsAll(b);

DateTime dateOnly(DateTime value) =>
    DateTime(value.year, value.month, value.day);

DateTime addDays(DateTime day, int days) =>
    DateTime(day.year, day.month, day.day + days);

bool sameDay(DateTime a, DateTime b) =>
    a.year == b.year && a.month == b.month && a.day == b.day;

bool isAfterDay(DateTime day, DateTime other) =>
    dateOnly(day).isAfter(dateOnly(other));

String dateKey(DateTime day) {
  final date = dateOnly(day);
  final month = date.month.toString().padLeft(2, '0');
  final value = date.day.toString().padLeft(2, '0');
  return '${date.year}-$month-$value';
}

String completionKey(String habitId, DateTime day) =>
    '$habitId|${dateKey(day)}';

class HabitSnapshot {
  const HabitSnapshot({required this.habits, required this.done});

  final List<Habit> habits;
  final Set<String> done;

  String encode() => jsonEncode({
    'habits': [for (final habit in habits) habit.toJson()],
    'done': (done.toList()..sort()),
  });

  factory HabitSnapshot.decode(String raw) {
    final json = jsonDecode(raw) as Map<String, dynamic>;
    final habits = (json['habits'] as List<dynamic>)
        .map((item) => Habit.fromJson(item as Map<String, dynamic>))
        .toList();
    final done = (json['done'] as List<dynamic>).cast<String>().toSet();
    return HabitSnapshot(habits: habits, done: done);
  }
}
