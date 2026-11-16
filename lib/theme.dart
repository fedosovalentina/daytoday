import 'package:flutter/material.dart';

/// Colors lifted from the notebook frames: cream paper, school-grid blue,
/// navy ink, and the seven habit pastels.
abstract final class AppColors {
  static const paper = Color(0xFFFBF7EC);
  static const grid = Color(0xFFD3DFEF);
  static const ink = Color(0xFF23317A);
  static const marker = Color(0xFFFFDA3A);
  static const muted = Color(0xFF9B9FBA);
  static const ad = Color(0xFFEEF1FA);
  static const flame = Color(0xFFE85D4C);
  static const white = Color(0xFFFFFFFF);
  static const tree = Color(0xFF3BA99C);

  static const pink = Color(0xFFFFD6DE);
  static const peach = Color(0xFFFFE0C3);
  static const yellow = Color(0xFFFEF0A7);
  static const mint = Color(0xFFD3F0DC);
  static const aqua = Color(0xFFC9F0EB);
  static const blue = Color(0xFFCFE3FE);
  static const lavender = Color(0xFFE4DAFF);
}

abstract final class AppText {
  /// Shantell covers Latin and Cyrillic. Arabic, CJK, and Devanagari
  /// fall through to a system face that actually has the glyphs.
  static const fallbacks = [
    'Noto Sans',
    'Noto Naskh Arabic',
    'Noto Sans Arabic',
    'Geeza Pro',
    'Noto Sans CJK SC',
    'PingFang SC',
    'Hiragino Sans',
    'Hiragino Sans GB',
    'Apple SD Gothic Neo',
    'Noto Sans Devanagari',
    'Kohinoor Devanagari',
    'sans-serif',
  ];

  static TextStyle of({
    double size = 16,
    FontWeight weight = FontWeight.w600,
    bool italic = false,
    Color color = AppColors.ink,
    double height = 1.15,
  }) {
    return TextStyle(
      fontFamily: 'ShantellSans',
      fontFamilyFallback: fallbacks,
      fontWeight: weight,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      fontSize: size,
      height: height,
      color: color,
    );
  }
}

abstract final class AppTheme {
  static ThemeData get light {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.paper,
      fontFamily: 'ShantellSans',
      fontFamilyFallback: AppText.fallbacks,
      colorScheme: const ColorScheme.light(
        primary: AppColors.ink,
        onPrimary: AppColors.marker,
        surface: AppColors.paper,
        onSurface: AppColors.ink,
      ),
    );
    return base.copyWith(
      textTheme: base.textTheme.apply(
        fontFamily: 'ShantellSans',
        fontFamilyFallback: AppText.fallbacks,
        bodyColor: AppColors.ink,
        displayColor: AppColors.ink,
      ),
      splashColor: AppColors.ink.withValues(alpha: 0.06),
      highlightColor: AppColors.ink.withValues(alpha: 0.04),
    );
  }
}

const double pageInset = 20;
