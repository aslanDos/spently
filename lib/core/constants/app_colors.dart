import 'package:flutter/material.dart';

abstract final class AppColorScheme {
  static const ColorScheme light = ColorScheme(
    brightness: Brightness.light,

    // === BRAND ===
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimary,

    secondary: AppColors.gray,
    onSecondary: AppColors.white,

    // === ERROR ===
    error: AppColors.error,
    onError: AppColors.white,

    // === SURFACE ===
    surface: AppColors.white,
    onSurface: AppColors.charcoal,

    outline: AppColors.grayLight,
    outlineVariant: AppColors.gray,

    shadow: Colors.black12,
    scrim: Colors.black38,

    inverseSurface: AppColors.charcoal,
    onInverseSurface: AppColors.white,
    inversePrimary: AppColors.gray,
  );

  static const ColorScheme dark = ColorScheme(
    brightness: Brightness.dark,

    // === BRAND ===
    primary: AppColors.white,
    onPrimary: AppColors.charcoal,

    secondary: AppColors.grayLight,
    onSecondary: AppColors.charcoal,

    // === ERROR ===
    error: AppColors.white,
    onError: AppColors.charcoal,

    // === SURFACE ===
    surface: AppColors.charcoal,
    onSurface: AppColors.white,

    outline: AppColors.gray,
    outlineVariant: AppColors.grayLight,

    shadow: Colors.black54,
    scrim: Colors.black87,

    inverseSurface: AppColors.white,
    onInverseSurface: AppColors.charcoal,
    inversePrimary: AppColors.gray,
  );
}

sealed class AppColors {
  // ===== CORE PALETTE (Salt & Pepper) =====
  static const Color white = Color(0xFFFFFFFF);
  static const Color grayLight = Color(0xFFD4D4D4);
  static const Color gray = Color(0xFFB3B3B3);
  static const Color charcoal = Color(0xFF2B2B2B);

  // ===== BRAND =====
  static const Color primary = charcoal;
  static const Color onPrimary = white;

  // ===== BACKGROUNDS =====
  static const Color backgroundLight = white;
  static const Color backgroundDark = charcoal;

  // ===== SURFACES =====
  static const Color surfaceLight = white;
  static const Color surfaceDark = charcoal;

  // ===== TEXT =====
  static const Color textPrimaryLight = charcoal;
  static const Color textSecondaryLight = gray;

  static const Color textPrimaryDark = white;
  static const Color textSecondaryDark = grayLight;

  // ===== STATUS =====
  static const Color success = Color.fromARGB(255, 153, 250, 187);
  static const Color warning = Color.fromARGB(255, 255, 225, 0);
  static const Color error = Color.fromARGB(255, 254, 129, 129);

  static const Color transparent = Colors.transparent;
}
