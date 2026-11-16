import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app.dart';
import '../models.dart';
import '../stats.dart';
import '../theme.dart';
import '../widgets/paper.dart';
import '../widgets/plan.dart';
import 'habit_screen.dart';
import 'new_habit_screen.dart';

class DayScreen extends StatelessWidget {
  const DayScreen({super.key, required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final store = HabitScope.of(context);
    final today = dateOnly(AppClock.of(context));
    final day = dateOnly(date);
    final habits = [
      for (final habit in store.active)
        if (habit.scheduledOn(day)) habit,
    ];

    return PaperScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, pageInset, 0),
            child: Row(
              children: [
                BackChevron(onPressed: () => Navigator.of(context).pop()),
                const SizedBox(width: 4),
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: MarkerText(
                      mediumDate(day),
                      style: AppText.of(size: 24, weight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(pageInset, 0, pageInset, 16),
              children: [
                if (habits.isEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      'Nothing planned for this day.',
                      style: AppText.of(
                        size: 18,
                        italic: true,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ),
                for (final habit in habits) ...[
                  HabitTile(
                    habit: habit,
                    done: store.isDone(habit.id, day),
                    streak: streak(habit, store.done, today),
                    onToggle: () {
                      HapticFeedback.selectionClick();
                      store.toggle(habit.id, day);
                    },
                    onOpen: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) =>
                              HabitScreen(habitId: habit.id, focus: day),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                ],
                DashedButton(
                  label: '+ New habit',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => NewHabitScreen(weekday: day.weekday),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: AdSlot(tall: true),
          ),
        ],
      ),
    );
  }
}
