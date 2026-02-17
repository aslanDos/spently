import 'package:flutter/material.dart';

abstract final class AppColorScheme {
  static const ColorScheme light = ColorScheme(
    brightness: Brightness.light,

    // === BRAND ===
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimary,

    secondary: AppColors.neutral800,
    onSecondary: AppColors.neutral0,

    // === ERROR ===
    error: AppColors.neutral900,
    onError: AppColors.neutral0,

    // === SURFACE ===
    surface: AppColors.surfaceLight,
    onSurface: AppColors.textPrimaryLight,

    outline: AppColors.neutral200,
    outlineVariant: AppColors.neutral100,

    shadow: Colors.black12,
    scrim: Colors.black38,

    inverseSurface: AppColors.neutral900,
    onInverseSurface: AppColors.neutral0,
    inversePrimary: AppColors.neutral800,
  );

  static const ColorScheme dark = ColorScheme(
    brightness: Brightness.dark,

    // === BRAND ===
    primary: AppColors.neutral0,
    onPrimary: AppColors.neutral900,

    secondary: AppColors.neutral300,
    onSecondary: AppColors.neutral900,

    // === ERROR ===
    error: AppColors.neutral0,
    onError: AppColors.neutral900,

    // === SURFACE ===
    surface: AppColors.surfaceDark,
    onSurface: AppColors.textPrimaryDark,

    outline: AppColors.neutral700,
    outlineVariant: AppColors.neutral800,

    shadow: Colors.black54,
    scrim: Colors.black87,

    inverseSurface: AppColors.neutral0,
    onInverseSurface: AppColors.neutral900,
    inversePrimary: AppColors.neutral200,
  );
}

abstract final class AppColors {
  // ===== PRIMARY (черный как бренд) =====
  static const Color primary = Color(0xFF000000);
  static const Color onPrimary = Color(0xFFFFFFFF);

  // ===== GRAYSCALE SCALE =====
  static const Color neutral0 = Color(0xFFFFFFFF);
  static const Color neutral50 = Color(0xFFF5F5F5);
  static const Color neutral100 = Color(0xFFEAEAEA);
  static const Color neutral200 = Color(0xFFD6D6D6);
  static const Color neutral300 = Color(0xFFBDBDBD);
  static const Color neutral400 = Color(0xFF9E9E9E);
  static const Color neutral500 = Color(0xFF757575);
  static const Color neutral600 = Color(0xFF616161);
  static const Color neutral700 = Color(0xFF424242);
  static const Color neutral800 = Color(0xFF212121);
  static const Color neutral900 = Color(0xFF111111);

  // ===== BACKGROUNDS =====
  static const Color backgroundLight = neutral50;
  static const Color backgroundDark = neutral900;

  // ===== SURFACES =====
  static const Color surfaceLight = neutral0;
  static const Color surfaceDark = neutral800;

  // ===== TEXT =====
  static const Color textPrimaryLight = neutral900;
  static const Color textSecondaryLight = neutral600;

  static const Color textPrimaryDark = neutral0;
  static const Color textSecondaryDark = neutral300;

  // ===== STATUS =====
  static const Color success = Color.fromARGB(255, 50, 255, 122);
  static const Color warning = Color(0xFF000000);
  static const Color error = Color.fromARGB(255, 255, 55, 55);

  static const Color transparent = Colors.transparent;
}

extension AppColorContext on BuildContext {
  ColorScheme get scheme => Theme.of(this).colorScheme;

  // === Brand ===
  Color get primary => scheme.primary;
  Color get onPrimary => scheme.onPrimary;

  // === Backgrounds ===
  Color get surface => scheme.surface;

  // === Text ===
  Color get textPrimary => scheme.onSurface;
  Color get textSecondary => scheme.onSurfaceVariant;

  // === Borders / Outline ===
  Color get border => scheme.outline;

  // === Status ===
  Color get error => scheme.error;
  Color get success => scheme.primary;
  Color get warning => scheme.primary;

  // === Inverse ===
  Color get inverseSurface => scheme.inverseSurface;
}
