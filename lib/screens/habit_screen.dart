import 'package:flutter/material.dart';

import '../app.dart';
import '../models.dart';
import '../stats.dart';
import '../theme.dart';
import '../widgets/icons.dart';
import '../widgets/paper.dart';
import '../widgets/plan.dart';
import '../widgets/rings.dart';

class HabitScreen extends StatefulWidget {
  const HabitScreen({super.key, required this.habitId, required this.focus});

  final String habitId;
  final DateTime focus;

  @override
  State<HabitScreen> createState() => _HabitScreenState();
}

class _HabitScreenState extends State<HabitScreen> {
  late final TextEditingController _name;
  late Set<int> _days;
  late HabitTone _tone;
  late DateTime _month;
  var _ready = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_ready) return;
    final habit = HabitScope.of(context).find(widget.habitId);
    _name = TextEditingController(text: habit?.name ?? '');
    _days = {...?habit?.days};
    _tone = habit?.tone ?? HabitTone.peach;
    _month = DateTime(widget.focus.year, widget.focus.month);
    _ready = true;
  }

  @override
  void dispose() {
    if (_ready) _name.dispose();
    super.dispose();
  }

  bool _dirty(Habit habit) {
    return _name.text.trim() != habit.name ||
        _tone != habit.tone ||
        !sameDays(_days, habit.days);
  }

  bool get _canSave => _name.text.trim().isNotEmpty && _days.isNotEmpty;

  Future<void> _leave(bool dirty) async {
    if (!dirty) {
      Navigator.of(context).pop();
      return;
    }
    final discard = await confirm(
      context,
      title: 'Leave without saving?',
      message: 'The name, days, and color stay as they were.',
      action: 'Discard',
    );
    if (discard && mounted) Navigator.of(context).pop();
  }

  void _save(Habit habit) {
    if (!_canSave) return;
    HabitScope.of(
      context,
    ).save(habit.copyWith(name: _name.text.trim(), tone: _tone, days: _days));
    Navigator.of(context).pop();
  }

  Future<void> _archive(Habit habit) async {
    final archive = await confirm(
      context,
      title: 'Archive ${habit.name}?',
      message: 'It leaves the plan. The history stays on this phone.',
      action: 'Archive',
    );
    if (!archive || !mounted) return;
    final store = HabitScope.of(context);
    Navigator.of(context).pop();
    await store.archive(habit.id);
  }

  void _shiftMonth(int delta) {
    setState(() => _month = DateTime(_month.year, _month.month + delta));
  }

  @override
  Widget build(BuildContext context) {
    final store = HabitScope.of(context);
    final habit = store.find(widget.habitId);
    if (!_ready || habit == null || habit.archived) {
      return const PaperScaffold(child: SizedBox.shrink());
    }
    final today = dateOnly(AppClock.of(context));
    final dirty = _dirty(habit);
    final kept = streak(habit, store.done, today);
    final total = daysTotal(habit, store.done);

    return PopScope(
      canPop: !dirty,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) _leave(true);
      },
      child: PaperScaffold(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, pageInset, 0),
              child: Row(
                children: [
                  BackChevron(onPressed: () => _leave(dirty)),
                  const SizedBox(width: 4),
                  Expanded(
                    child: HabitNameField(
                      controller: _name,
                      code: HabitLabel.fromName(_name.text).code,
                      hint: 'Name',
                      onChanged: (_) => setState(() {}),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(
                  pageInset,
                  22,
                  pageInset,
                  16,
                ),
                children: [
                  Text(
                    'Days',
                    style: AppText.of(size: 18, weight: FontWeight.w700),
                  ),
                  const SizedBox(height: 12),
                  WeekdayPicker(
                    selected: _days,
                    color: _tone.color,
                    onToggle: (weekday) {
                      setState(() {
                        if (!_days.add(weekday)) _days.remove(weekday);
                      });
                    },
                  ),
                  const SizedBox(height: 22),
                  Text(
                    'Color',
                    style: AppText.of(size: 18, weight: FontWeight.w700),
                  ),
                  const SizedBox(height: 12),
                  TonePicker(
                    selected: _tone,
                    onChanged: (tone) => setState(() => _tone = tone),
                  ),
                  const SizedBox(height: 28),
                  Text(
                    'Progress · ${monthNames[_month.month - 1]}',
                    style: AppText.of(size: 20, weight: FontWeight.w700),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: StatCard(
                          color: AppColors.peach,
                          icon: const FlameIcon(size: 16),
                          value: '$kept',
                          caption: 'day streak',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: StatCard(
                          color: AppColors.blue,
                          icon: const CalendarIcon(),
                          value: '$total',
                          caption: 'days total',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  MonthTitle(
                    label: monthNames[_month.month - 1],
                    trailing: monthScore([habit], store.done, _month).label,
                    onPrevious: () => _shiftMonth(-1),
                    onNext: () => _shiftMonth(1),
                  ),
                  const SizedBox(height: 8),
                  const WeekdayHeader(),
                  const SizedBox(height: 8),
                  MonthSwipe(
                    onSwipe: _shiftMonth,
                    child: MonthGrid(
                      month: _month,
                      cell: (day) {
                        final planned = habit.scheduledOn(day);
                        final done = planned && store.isDone(habit.id, day);
                        return ToneDay(
                          label: '${day.day}',
                          diameter: 34,
                          scheduled: planned,
                          fill: done ? habit.tone.color : null,
                          selected: sameDay(day, widget.focus),
                          onTap: planned
                              ? () => store.toggle(habit.id, day)
                              : null,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(pageInset, 0, pageInset, 16),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: GhostButton(
                      label: 'Archive',
                      onPressed: () => _archive(habit),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 3,
                    child: PrimaryButton(
                      label: 'Save changes',
                      onPressed: _canSave ? () => _save(habit) : null,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
