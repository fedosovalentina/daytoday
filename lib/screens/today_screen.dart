import 'package:flutter/material.dart';

import '../app.dart';
import '../models.dart';
import '../stats.dart';
import '../theme.dart';
import '../widgets/paper.dart';
import '../widgets/plan.dart';
import '../widgets/rings.dart';
import 'day_screen.dart';
import 'habit_screen.dart';
import 'new_habit_screen.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  DateTime? _selected;

  DateTime get _day => _selected!;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selected ??= dateOnly(AppClock.of(context));
  }

  void _select(DateTime day) {
    final next = dateOnly(day);
    if (!sameDay(next, _day)) {
      setState(() => _selected = next);
      return;
    }
    _openDay(next);
  }

  void _openDay(DateTime day) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => DayScreen(date: day)));
  }

  void _shiftMonth(int delta) {
    final current = _day;
    final target = DateTime(current.year, current.month + delta, 1);
    final last = DateTime(target.year, target.month + 1, 0).day;
    setState(() {
      _selected = DateTime(
        target.year,
        target.month,
        current.day.clamp(1, last).toInt(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final today = dateOnly(AppClock.of(context));
    final store = HabitScope.of(context);
    final habits = store.active;
    final score = dayScore(habits, store.done, _day);
    final month = monthScore(habits, store.done, _day);

    return PaperScaffold(
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        padding: const EdgeInsets.fromLTRB(pageInset, 12, pageInset, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _openDay(_day),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: MarkerText(
                        longDate(_day),
                        style: AppText.of(size: 24, weight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                AddHabitButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => NewHabitScreen(weekday: _day.weekday),
                      ),
                    );
                  },
                ),
              ],
            ),
            if (!sameDay(_day, today))
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => setState(() => _selected = today),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      'Back to today',
                      style: AppText.of(
                        size: 14,
                        italic: true,
                        weight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 18),
            WeekStrip(
              selected: _day,
              today: today,
              colorsFor: (day) => [
                for (final tone in tonesOn(habits, day)) tone.color,
              ],
              onSelect: _select,
            ),
            const SizedBox(height: 26),
            SectionHead(
              title: planTitle(_day, today),
              trailing: score.planned == 0 ? null : score.label,
              onTitle: () => _openDay(_day),
            ),
            const SizedBox(height: 12),
            if (score.planned == 0)
              SizedBox(
                height: 112,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    habits.isEmpty
                        ? 'Tap + and plant the first habit.'
                        : 'A free day.',
                    style: AppText.of(
                      size: 18,
                      italic: true,
                      weight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            else
              SizedBox(
                height: 164,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  padding: const EdgeInsets.fromLTRB(2, 4, 8, 8),
                  itemCount: habits
                      .where((habit) => habit.scheduledOn(_day))
                      .length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final planned = [
                      for (final habit in habits)
                        if (habit.scheduledOn(_day)) habit,
                    ];
                    final habit = planned[index];
                    return PlanCard(
                      habit: habit,
                      streak: streak(habit, store.done, today),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) =>
                                HabitScreen(habitId: habit.id, focus: _day),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            const SizedBox(height: 22),
            MonthTitle(
              label: monthNames[_day.month - 1],
              trailing: month.label,
              onPrevious: () => _shiftMonth(-1),
              onNext: () => _shiftMonth(1),
            ),
            const SizedBox(height: 8),
            WeekdayHeader(),
            const SizedBox(height: 8),
            MonthSwipe(
              onSwipe: _shiftMonth,
              child: MonthGrid(
                month: _day,
                cell: (day) => DayRing(
                  label: '${day.day}',
                  colors: [for (final tone in tonesOn(habits, day)) tone.color],
                  diameter: 36,
                  future: isAfterDay(day, today),
                  selected: sameDay(day, _day),
                  today: sameDay(day, today),
                  onTap: () => _select(day),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
