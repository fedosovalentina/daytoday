import 'package:flutter/material.dart';

import '../models.dart';
import '../theme.dart';
import 'icons.dart';
import 'paper.dart';

class PlanCard extends StatelessWidget {
  const PlanCard({
    super.key,
    required this.habit,
    required this.streak,
    required this.onTap,
  });

  final Habit habit;
  final int streak;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final label = habit.label;
    return Semantics(
      button: true,
      label: '${habit.name}, $streak day streak',
      child: OffsetCard(
        color: habit.tone.color,
        radius: 22,
        onTap: onTap,
        child: SizedBox(
          width: 124,
          height: 148,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '$streak',
                      style: AppText.of(
                        size: 14,
                        weight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                    const SizedBox(width: 3),
                    const FlameIcon(size: 13),
                  ],
                ),
                const Spacer(),
                Text(
                  label.code,
                  style: AppText.of(
                    size: 32,
                    weight: FontWeight.w800,
                    height: 1,
                  ),
                ),
                if (label.rest != null)
                  Text(
                    label.rest!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppText.of(
                      size: 13,
                      weight: FontWeight.w500,
                      height: 1.1,
                    ),
                  ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HabitTile extends StatelessWidget {
  const HabitTile({
    super.key,
    required this.habit,
    required this.done,
    required this.streak,
    required this.onToggle,
    required this.onOpen,
  });

  final Habit habit;
  final bool done;
  final int streak;
  final VoidCallback onToggle;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    final inkOnCard = done ? habit.tone.color : AppColors.ink;
    return OffsetCard(
      color: done ? AppColors.ink : habit.tone.color,
      radius: 20,
      child: SizedBox(
        height: 108,
        child: Row(
          children: [
            Semantics(
              button: true,
              label: 'Open ${habit.name}',
              excludeSemantics: true,
              child: InkWell(
                onTap: onOpen,
                child: ColoredBox(
                  color: habit.tone.color,
                  child: SizedBox(
                    width: 100,
                    height: 108,
                    child: Center(
                      child: Text(
                        habit.label.code,
                        style: AppText.of(
                          size: 26,
                          weight: FontWeight.w800,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Semantics(
                button: true,
                label: done
                    ? 'Mark ${habit.name} not done'
                    : 'Mark ${habit.name} done',
                excludeSemantics: true,
                child: InkWell(
                  onTap: onToggle,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                habit.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppText.of(
                                  size: 22,
                                  weight: FontWeight.w700,
                                  height: 1,
                                  color: inkOnCard,
                                ),
                              ),
                            ),
                            if (done) const CheckIcon(),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                weekdayList(habit.days),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppText.of(
                                  size: 13,
                                  italic: true,
                                  weight: FontWeight.w500,
                                  color: inkOnCard.withValues(alpha: 0.85),
                                ),
                              ),
                            ),
                            Text(
                              '$streak',
                              style: AppText.of(
                                size: 16,
                                weight: FontWeight.w700,
                                height: 1,
                                color: inkOnCard,
                              ),
                            ),
                            const SizedBox(width: 4),
                            FlameIcon(
                              size: 14,
                              color: done ? AppColors.marker : AppColors.flame,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.color,
    required this.icon,
    required this.value,
    required this.caption,
  });

  final Color color;
  final Widget icon;
  final String value;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return OffsetCard(
      color: color,
      radius: 18,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        child: Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.ink, width: 1.6),
              ),
              child: SizedBox(
                width: 36,
                height: 36,
                child: Center(child: icon),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: AppText.of(
                      size: 28,
                      weight: FontWeight.w800,
                      height: 1,
                    ),
                  ),
                  Text(
                    caption,
                    style: AppText.of(
                      size: 13,
                      italic: true,
                      weight: FontWeight.w500,
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

class WeekdayPicker extends StatelessWidget {
  const WeekdayPicker({
    super.key,
    required this.selected,
    required this.color,
    required this.onToggle,
  });

  final Set<int> selected;
  final Color color;
  final ValueChanged<int> onToggle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (var index = 0; index < weekdayShort.length; index++)
          _DayChip(
            label: weekdayShort[index],
            filled: selected.contains(index + 1),
            color: color,
            onTap: () => onToggle(index + 1),
          ),
      ],
    );
  }
}

class _DayChip extends StatelessWidget {
  const _DayChip({
    required this.label,
    required this.filled,
    required this.color,
    required this.onTap,
  });

  final String label;
  final bool filled;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: filled,
      label: label,
      child: GestureDetector(
        onTap: onTap,
        child: CustomPaint(
          painter: _ChipPainter(filled: filled, color: color),
          child: SizedBox(
            width: 36,
            height: 36,
            child: Center(
              child: Text(
                label,
                style: AppText.of(size: 12, weight: FontWeight.w700, height: 1),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ChipPainter extends CustomPainter {
  const _ChipPainter({required this.filled, required this.color});

  final bool filled;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.shortestSide / 2 - 1;
    if (filled) {
      canvas.drawCircle(center, radius, Paint()..color = color);
      canvas.drawCircle(
        center,
        radius,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.6
          ..color = AppColors.ink,
      );
      return;
    }
    const count = 12;
    final paint = Paint()
      ..color = AppColors.ink.withValues(alpha: 0.55)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.3
      ..strokeCap = StrokeCap.round;
    final rect = Rect.fromCircle(center: center, radius: radius);
    for (var i = 0; i < count; i++) {
      final start = -3.14159 / 2 + (i / count) * 6.28318;
      canvas.drawArc(rect, start, 0.22, false, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _ChipPainter oldDelegate) {
    return oldDelegate.filled != filled || oldDelegate.color != color;
  }
}

class TonePicker extends StatelessWidget {
  const TonePicker({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final HabitTone selected;
  final ValueChanged<HabitTone> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (final tone in HabitTone.values)
          Semantics(
            button: true,
            selected: tone == selected,
            label: tone.name,
            child: GestureDetector(
              onTap: () => onChanged(tone),
              child: SizedBox(
                width: 34,
                height: 34,
                child: CustomPaint(
                  painter: _ToneDotPainter(
                    color: tone.color,
                    selected: tone == selected,
                  ),
                  child: tone == selected
                      ? const Center(
                          child: CheckIcon(size: 16, color: AppColors.ink),
                        )
                      : null,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _ToneDotPainter extends CustomPainter {
  const _ToneDotPainter({required this.color, required this.selected});

  final Color color;
  final bool selected;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.shortestSide / 2 - (selected ? 3 : 1);
    canvas.drawCircle(center, radius, Paint()..color = color);
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.6
        ..color = AppColors.ink,
    );
    if (selected) {
      canvas.drawCircle(
        center,
        size.shortestSide / 2 - 0.8,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.6
          ..color = AppColors.ink,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _ToneDotPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.selected != selected;
  }
}

class SuggestionChips extends StatelessWidget {
  const SuggestionChips({super.key, required this.onPick});

  final void Function(String name, HabitTone tone) onPick;

  static const options = [
    ('Gym', HabitTone.pink),
    ('Run', HabitTone.peach),
    ('Read', HabitTone.blue),
    ('Water', HabitTone.yellow),
    ('Stretch', HabitTone.lavender),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final (name, tone) in options)
          _Chip(label: name, onTap: () => onPick(name, tone)),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: AppColors.ink, width: 1.6),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            label,
            style: AppText.of(size: 15, weight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

class HabitNameField extends StatelessWidget {
  const HabitNameField({
    super.key,
    required this.controller,
    required this.code,
    this.hint = 'Habit name',
    this.onChanged,
  });

  final TextEditingController controller;
  final String code;
  final String hint;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final line = const UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.ink, width: 1.4),
    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            cursorColor: AppColors.ink,
            style: AppText.of(size: 22, weight: FontWeight.w700),
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: AppText.of(
                size: 22,
                weight: FontWeight.w500,
                color: AppColors.muted,
              ),
              isDense: true,
              contentPadding: const EdgeInsets.only(bottom: 8),
              border: line,
              enabledBorder: line,
              focusedBorder: line,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: OffsetCard(
            color: const Color(0xFFFFF1EA),
            radius: 10,
            shadowOffset: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Text(
                code,
                style: AppText.of(size: 16, weight: FontWeight.w800, height: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
