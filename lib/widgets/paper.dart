import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme.dart';
import 'icons.dart';

class GraphPaper extends StatelessWidget {
  const GraphPaper({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomPaint(painter: _GraphPainter());
  }
}

class _GraphPainter extends CustomPainter {
  const _GraphPainter();

  static const step = 24.0;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.grid
      ..strokeWidth = 1;
    for (var x = 0.0; x <= size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (var y = 0.0; y <= size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class PaperScaffold extends StatelessWidget {
  const PaperScaffold({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.paper,
      body: Stack(
        children: [
          const Positioned.fill(child: IgnorePointer(child: GraphPaper())),
          SafeArea(child: child),
        ],
      ),
    );
  }
}

/// A yellow marker stroke sitting behind the lower half of a line of text.
class MarkerText extends StatelessWidget {
  const MarkerText(this.text, {super.key, required this.style});

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final bar = (style.fontSize ?? 16) * 0.34;
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Positioned(
          left: 0,
          right: 0,
          bottom: 1,
          height: bar,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.marker,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ),
        Text(text, style: style),
      ],
    );
  }
}

/// Sticker card: paper fill, navy border, hard offset shadow.
class OffsetCard extends StatelessWidget {
  const OffsetCard({
    super.key,
    required this.child,
    required this.color,
    this.radius = 18,
    this.shadow = AppColors.ink,
    this.shadowOffset = 4,
    this.onTap,
  });

  final Widget child;
  final Color color;
  final double radius;
  final Color shadow;
  final double shadowOffset;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius),
      side: const BorderSide(color: AppColors.ink, width: 2),
    );
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: shadowOffset == 0
            ? null
            : [
                BoxShadow(
                  color: shadow,
                  offset: Offset(shadowOffset, shadowOffset),
                ),
              ],
      ),
      child: Material(
        color: color,
        shape: shape,
        clipBehavior: Clip.antiAlias,
        child: onTap == null
            ? child
            : InkWell(onTap: onTap, customBorder: shape, child: child),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;
    return OffsetCard(
      color: enabled ? AppColors.ink : AppColors.muted,
      radius: 16,
      shadow: AppColors.marker,
      shadowOffset: enabled ? 4 : 0,
      onTap: onPressed,
      child: SizedBox(
        height: 56,
        width: double.infinity,
        child: Center(
          child: Text(
            label,
            style: AppText.of(
              size: 20,
              weight: FontWeight.w700,
              color: enabled ? AppColors.marker : AppColors.paper,
            ),
          ),
        ),
      ),
    );
  }
}

class GhostButton extends StatelessWidget {
  const GhostButton({super.key, required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OffsetCard(
      color: AppColors.paper,
      radius: 16,
      shadowOffset: 0,
      onTap: onPressed,
      child: SizedBox(
        height: 56,
        width: double.infinity,
        child: Center(
          child: Text(
            label,
            style: AppText.of(size: 18, weight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

class BackChevron extends StatelessWidget {
  const BackChevron({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Back',
      excludeSemantics: true,
      child: InkResponse(
        onTap: onPressed,
        radius: 24,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(2, 4, 8, 4),
          child: Text(
            '‹',
            style: AppText.of(size: 34, weight: FontWeight.w700, height: 1),
          ),
        ),
      ),
    );
  }
}

class AddHabitButton extends StatelessWidget {
  const AddHabitButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'New habit',
      excludeSemantics: true,
      child: SizedBox(
        width: 68,
        height: 68,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 0,
              bottom: 0,
              child: OffsetCard(
                color: AppColors.white,
                radius: 28,
                shadowOffset: 3,
                onTap: onPressed,
                child: SizedBox(
                  width: 52,
                  height: 52,
                  child: Center(
                    child: Text(
                      '+',
                      style: AppText.of(
                        size: 32,
                        weight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Positioned(
              right: -2,
              top: -2,
              child: IgnorePointer(child: TreeDoodle()),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionHead extends StatelessWidget {
  const SectionHead({
    super.key,
    required this.title,
    this.trailing,
    this.onTitle,
  });

  final String title;
  final String? trailing;
  final VoidCallback? onTitle;

  @override
  Widget build(BuildContext context) {
    final label = Text(
      title,
      style: AppText.of(size: 26, weight: FontWeight.w700),
    );
    return Row(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: onTitle == null
                  ? label
                  : GestureDetector(onTap: onTitle, child: label),
            ),
          ),
        ),
        if (trailing != null) ...[
          const SizedBox(width: 12),
          Text(
            trailing!,
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

/// Reserved band for a future ad. The copy in the frames was a layout note,
/// so the slot stays quiet: a dashed outline and a small AD mark.
class AdSlot extends StatelessWidget {
  const AdSlot({super.key, this.tall = false});

  final bool tall;

  @override
  Widget build(BuildContext context) {
    final height = tall ? MediaQuery.sizeOf(context).height / 6 : 76.0;
    return Semantics(
      label: 'Advertisement placeholder',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: pageInset),
        child: CustomPaint(
          painter: const _DashedPainter(filled: true),
          child: SizedBox(
            height: height,
            width: double.infinity,
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'AD',
                  style: AppText.of(
                    size: 11,
                    weight: FontWeight.w700,
                    color: AppColors.muted,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DashedButton extends StatelessWidget {
  const DashedButton({super.key, required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: label,
      child: GestureDetector(
        onTap: onPressed,
        child: CustomPaint(
          painter: const _DashedPainter(),
          child: SizedBox(
            height: 52,
            width: double.infinity,
            child: Center(
              child: Text(
                label,
                style: AppText.of(size: 18, weight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DashedPainter extends CustomPainter {
  const _DashedPainter({this.filled = false});

  final bool filled;

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.height > 90 ? 18.0 : 14.0;
    final rect = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(radius),
    );
    if (filled) {
      canvas.drawRRect(
        rect.deflate(1),
        Paint()..color = AppColors.ad.withValues(alpha: 0.72),
      );
    }
    final source = Path()..addRRect(rect.deflate(1));
    final paint = Paint()
      ..color = AppColors.ink.withValues(alpha: 0.45)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4;
    canvas.drawPath(_dash(source), paint);
  }

  Path _dash(Path source) {
    const dash = 7.0;
    const gap = 5.0;
    final dest = Path();
    for (final metric in source.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final end = math.min(distance + dash, metric.length);
        dest.addPath(metric.extractPath(distance, end), Offset.zero);
        distance = end + gap;
      }
    }
    return dest;
  }

  @override
  bool shouldRepaint(covariant _DashedPainter oldDelegate) =>
      oldDelegate.filled != filled;
}

Future<bool> confirm(
  BuildContext context, {
  required String title,
  required String message,
  required String action,
}) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.paper,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: const BorderSide(color: AppColors.ink, width: 2),
        ),
        title: Text(
          title,
          style: AppText.of(size: 22, weight: FontWeight.w700),
        ),
        content: Text(
          message,
          style: AppText.of(size: 16, weight: FontWeight.w500),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Keep', style: AppText.of(size: 16)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              action,
              style: AppText.of(size: 16, weight: FontWeight.w700),
            ),
          ),
        ],
      );
    },
  );
  return result ?? false;
}
