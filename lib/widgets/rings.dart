import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../models.dart';
import '../theme.dart';

class WeekdayHeader extends StatelessWidget {
  const WeekdayHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppText.of(
      size: 12,
      italic: true,
      weight: FontWeight.w500,
      color: AppColors.ink.withValues(alpha: 0.7),
    );
    return Row(
      children: [
        for (final label in weekdayShort)
          Expanded(
            child: Text(label, textAlign: TextAlign.center, style: style),
          ),
      ],
    );
  }
}

class MonthTitle extends StatelessWidget {
  const MonthTitle({
    super.key,
    required this.label,
    required this.trailing,
    required this.onPrevious,
    required this.onNext,
  });

  final String label;
  final String trailing;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _Chevron(
                    label: '‹',
                    tooltip: 'Previous month',
                    onPressed: onPrevious,
                  ),
                  Text(
                    label,
                    style: AppText.of(size: 26, weight: FontWeight.w700),
                  ),
                  _Chevron(
                    label: '›',
                    tooltip: 'Next month',
                    onPressed: onNext,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (trailing.isNotEmpty) ...[
          const SizedBox(width: 8),
          Text(
            trailing,
            style: AppText.of(
              size: 16,
              weight: FontWeight.w600,
              color: AppColors.ink.withValues(alpha: 0.72),
            ),
          ),
        ],
      ],
    );
  }
}

class _Chevron extends StatelessWidget {
  const _Chevron({
    required this.label,
    required this.tooltip,
    required this.onPressed,
  });

  final String label;
  final String tooltip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: tooltip,
      child: InkResponse(
        onTap: onPressed,
        radius: 22,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: Text(
            label,
            style: AppText.of(size: 26, weight: FontWeight.w700, height: 1),
          ),
        ),
      ),
    );
  }
}

class MonthSwipe extends StatelessWidget {
  const MonthSwipe({super.key, required this.onSwipe, required this.child});

  final ValueChanged<int> onSwipe;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onHorizontalDragEnd: (details) {
        final velocity = details.primaryVelocity ?? 0;
        if (velocity.abs() < 180) return;
        onSwipe(velocity < 0 ? 1 : -1);
      },
      child: child,
    );
  }
}

class MonthGrid extends StatelessWidget {
  const MonthGrid({super.key, required this.month, required this.cell});

  final DateTime month;
  final Widget Function(DateTime day) cell;

  @override
  Widget build(BuildContext context) {
    final first = DateTime(month.year, month.month, 1);
    final count = DateTime(month.year, month.month + 1, 0).day;
    final lead = first.weekday - 1;
    final rowCount = ((lead + count) / 7).ceil();
    return Column(
      children: [
        for (var row = 0; row < rowCount; row++) ...[
          Row(
            children: [
              for (var column = 0; column < 7; column++)
                Expanded(
                  child: Center(child: _slot(row * 7 + column, lead, count)),
                ),
            ],
          ),
          const SizedBox(height: 6),
        ],
      ],
    );
  }

  Widget _slot(int index, int lead, int count) {
    if (index < lead || index >= lead + count) {
      return const SizedBox(width: 36, height: 36);
    }
    return cell(DateTime(month.year, month.month, index - lead + 1));
  }
}

class WeekStrip extends StatelessWidget {
  const WeekStrip({
    super.key,
    required this.selected,
    required this.today,
    required this.colorsFor,
    required this.onSelect,
  });

  final DateTime selected;
  final DateTime today;
  final List<Color> Function(DateTime day) colorsFor;
  final ValueChanged<DateTime> onSelect;

  @override
  Widget build(BuildContext context) {
    final start = addDays(dateOnly(selected), -(selected.weekday - 1));
    final days = [for (var i = 0; i < 7; i++) addDays(start, i)];
    return LayoutBuilder(
      builder: (context, constraints) {
        final diameter = math.min(42.0, constraints.maxWidth / 7);
        return Column(
          children: [
            Row(
              children: [
                for (final day in days)
                  Expanded(
                    child: Text(
                      weekdayShort[day.weekday - 1],
                      textAlign: TextAlign.center,
                      style: AppText.of(
                        size: 13,
                        italic: true,
                        weight: sameDay(day, selected)
                            ? FontWeight.w800
                            : FontWeight.w500,
                        color: isAfterDay(day, today)
                            ? AppColors.ink.withValues(alpha: 0.4)
                            : AppColors.ink,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 6),
            SizedBox(
              height: 48,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                    child: CustomPaint(
                      painter: _WeekLinePainter(days: days, today: today),
                    ),
                  ),
                  Row(
                    children: [
                      for (final day in days)
                        Expanded(
                          child: Center(
                            child: DayRing(
                              label: '${day.day}',
                              colors: colorsFor(day),
                              diameter: diameter,
                              future: isAfterDay(day, today),
                              selected: sameDay(day, selected),
                              today: sameDay(day, today),
                              onTap: () => onSelect(day),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _WeekLinePainter extends CustomPainter {
  const _WeekLinePainter({required this.days, required this.today});

  final List<DateTime> days;
  final DateTime today;

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width == 0) return;
    final y = size.height / 2;
    final slot = size.width / 7;
    Offset center(int index) => Offset(slot * index + slot / 2, y);
    final solid = Paint()
      ..color = AppColors.ink
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    final faint = Paint()
      ..color = AppColors.ink.withValues(alpha: 0.35)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    for (var i = 0; i < 6; i++) {
      final start = center(i);
      final end = center(i + 1);
      if (isAfterDay(days[i + 1], today)) {
        _dash(canvas, start, end, faint);
      } else {
        canvas.drawLine(start, end, solid);
      }
    }
  }

  void _dash(Canvas canvas, Offset start, Offset end, Paint paint) {
    const dash = 4.0;
    const gap = 4.0;
    final delta = end - start;
    final length = delta.distance;
    if (length == 0) return;
    final direction = delta / length;
    var drawn = 0.0;
    while (drawn < length) {
      final stop = math.min(drawn + dash, length);
      canvas.drawLine(
        start + direction * drawn,
        start + direction * stop,
        paint,
      );
      drawn = stop + gap;
    }
  }

  @override
  bool shouldRepaint(covariant _WeekLinePainter oldDelegate) {
    return oldDelegate.today != today || oldDelegate.days != days;
  }
}

/// A day on the home page: colored arcs for the habits planned that day.
/// Future days, and days with nothing planned, stay dotted.
class DayRing extends StatelessWidget {
  const DayRing({
    super.key,
    required this.label,
    required this.colors,
    required this.diameter,
    this.future = false,
    this.selected = false,
    this.today = false,
    this.onTap,
  });

  final String label;
  final List<Color> colors;
  final double diameter;
  final bool future;
  final bool selected;
  final bool today;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final ring = SizedBox(
      width: diameter,
      height: diameter,
      child: CustomPaint(
        painter: _SegmentPainter(
          colors: future ? const [] : colors,
          dotted: future || colors.isEmpty,
          selected: selected,
          markToday: today && !selected,
        ),
        child: Center(
          child: Text(
            label,
            style: AppText.of(
              size: diameter * 0.34,
              weight: selected ? FontWeight.w800 : FontWeight.w600,
              height: 1,
              color: future && !selected
                  ? AppColors.ink.withValues(alpha: 0.45)
                  : AppColors.ink,
            ),
          ),
        ),
      ),
    );
    if (onTap == null) return ring;
    return Semantics(
      button: true,
      selected: selected,
      label: label,
      child: GestureDetector(onTap: onTap, child: ring),
    );
  }
}

class _SegmentPainter extends CustomPainter {
  const _SegmentPainter({
    required this.colors,
    required this.dotted,
    required this.selected,
    required this.markToday,
  });

  final List<Color> colors;
  final bool dotted;
  final bool selected;
  final bool markToday;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final outer = size.shortestSide / 2;
    final ring = outer - 5;
    canvas.drawCircle(center, ring - 3.2, Paint()..color = AppColors.paper);

    if (selected) {
      canvas.drawCircle(
        center,
        outer - 1.2,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..color = AppColors.ink,
      );
    }

    if (dotted || colors.isEmpty) {
      _dotted(canvas, center, ring);
    } else {
      _segments(canvas, center, ring, colors);
    }

    if (markToday) {
      canvas.drawCircle(
        Offset(center.dx, center.dy + ring + 1),
        2.1,
        Paint()..color = AppColors.marker,
      );
    }
  }

  void _dotted(Canvas canvas, Offset center, double radius) {
    const count = 16;
    final paint = Paint()
      ..color = AppColors.ink.withValues(alpha: 0.55)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;
    final rect = Rect.fromCircle(center: center, radius: radius);
    for (var i = 0; i < count; i++) {
      final start = -math.pi / 2 + (i / count) * math.pi * 2;
      canvas.drawArc(rect, start, 0.55 / count * math.pi * 2, false, paint);
    }
  }

  void _segments(
    Canvas canvas,
    Offset center,
    double radius,
    List<Color> colors,
  ) {
    final rect = Rect.fromCircle(center: center, radius: radius);
    final count = colors.length;
    final gap = count == 1 ? 0.4 : 0.26;
    final sweep = (math.pi * 2 / count) - gap;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.butt;
    for (var i = 0; i < count; i++) {
      paint.color = colors[i];
      final start = -math.pi / 2 + gap / 2 + i * (math.pi * 2 / count);
      canvas.drawArc(rect, start, sweep, false, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _SegmentPainter oldDelegate) {
    if (oldDelegate.dotted != dotted ||
        oldDelegate.selected != selected ||
        oldDelegate.markToday != markToday ||
        oldDelegate.colors.length != colors.length) {
      return true;
    }
    for (var i = 0; i < colors.length; i++) {
      if (oldDelegate.colors[i] != colors[i]) return true;
    }
    return false;
  }
}

/// One habit's month: a filled pastel when the day was kept,
/// a dotted ring when it was planned and missed, a bare number otherwise.
class ToneDay extends StatelessWidget {
  const ToneDay({
    super.key,
    required this.label,
    required this.diameter,
    this.fill,
    this.scheduled = false,
    this.selected = false,
    this.onTap,
  });

  final String label;
  final double diameter;
  final Color? fill;
  final bool scheduled;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dot = SizedBox(
      width: diameter,
      height: diameter,
      child: CustomPaint(
        painter: _TonePainter(
          fill: scheduled ? fill : null,
          dotted: scheduled && fill == null,
          selected: selected,
        ),
        child: Center(
          child: Text(
            label,
            style: AppText.of(
              size: diameter * 0.36,
              weight: selected ? FontWeight.w800 : FontWeight.w600,
              height: 1,
            ),
          ),
        ),
      ),
    );
    if (onTap == null) return dot;
    return GestureDetector(onTap: onTap, child: dot);
  }
}

class _TonePainter extends CustomPainter {
  const _TonePainter({
    required this.fill,
    required this.dotted,
    required this.selected,
  });

  final Color? fill;
  final bool dotted;
  final bool selected;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final outer = size.shortestSide / 2;
    if (fill != null) {
      canvas.drawCircle(center, outer - 2, Paint()..color = fill!);
      canvas.drawCircle(
        center,
        outer - 2,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.6
          ..color = AppColors.ink,
      );
    } else if (dotted) {
      _dotted(canvas, center, outer - 4);
    }
    if (selected) {
      canvas.drawCircle(
        center,
        outer - 0.8,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..color = AppColors.ink,
      );
    }
  }

  void _dotted(Canvas canvas, Offset center, double radius) {
    const count = 14;
    final paint = Paint()
      ..color = AppColors.ink.withValues(alpha: 0.55)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4
      ..strokeCap = StrokeCap.round;
    final rect = Rect.fromCircle(center: center, radius: radius);
    for (var i = 0; i < count; i++) {
      final start = -math.pi / 2 + (i / count) * math.pi * 2;
      canvas.drawArc(rect, start, 0.5 / count * math.pi * 2, false, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _TonePainter oldDelegate) {
    return oldDelegate.fill != fill ||
        oldDelegate.dotted != dotted ||
        oldDelegate.selected != selected;
  }
}
