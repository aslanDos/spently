import 'package:flutter/material.dart';
import 'package:spently/core/constants/app_colors.dart';
import 'package:spently/core/constants/app_sizes.dart';
import 'package:spently/core/constants/app_text_styles.dart';

sealed class AppTheme {
  static final ThemeData light = _buildTheme(AppColorScheme.light);
  static final ThemeData dark = _buildTheme(AppColorScheme.dark);

  static final TextTheme _textTheme = TextTheme(
    displayLarge: AppTextStyle.displayLarge,
    displayMedium: AppTextStyle.displayMedium,
    displaySmall: AppTextStyle.displaySmall,
    headlineLarge: AppTextStyle.headlineLarge,
    headlineMedium: AppTextStyle.headlineMedium,
    headlineSmall: AppTextStyle.headlineSmall,
    titleLarge: AppTextStyle.titleLarge,
    titleMedium: AppTextStyle.titleMedium,
    titleSmall: AppTextStyle.titleSmall,
    bodyLarge: AppTextStyle.bodyLarge,
    bodyMedium: AppTextStyle.bodyMedium,
    bodySmall: AppTextStyle.bodySmall,
    labelLarge: AppTextStyle.labelLarge,
    labelMedium: AppTextStyle.labelMedium,
    labelSmall: AppTextStyle.labelSmall,
  );

  static const BorderRadius _buttonRadius = BorderRadius.all(
    Radius.circular(AppSizes.radiusFull),
  );

  static const BorderRadius _cardRadius = BorderRadius.all(
    Radius.circular(AppSizes.radiusLarge),
  );

  static ThemeData _buildTheme(ColorScheme scheme) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      brightness: scheme.brightness,
      textTheme: _textTheme,
      scaffoldBackgroundColor: scheme.background,
      visualDensity: VisualDensity.adaptivePlatformDensity,

      // ================= APP BAR =================
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextStyle.titleLarge.copyWith(
          color: scheme.onSurface,
          fontWeight: AppFontWeight.semiBold,
        ),
      ),

      // ================= CARD =================
      cardTheme: CardThemeData(
        color: scheme.surface,
        elevation: 0,
        margin: const EdgeInsets.all(AppSizes.small),
        shape: const RoundedRectangleBorder(borderRadius: _cardRadius),
      ),

      // ================= ELEVATED BUTTON =================
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          elevation: 0,
          shape: const RoundedRectangleBorder(borderRadius: _buttonRadius),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.large,
            vertical: AppSizes.medium,
          ),
          textStyle: AppTextStyle.bodyMedium.copyWith(
            fontWeight: AppFontWeight.semiBold,
          ),
        ),
      ),

      // ================= OUTLINED BUTTON =================
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: scheme.onSurface,
          side: BorderSide(color: scheme.outline),
          shape: const RoundedRectangleBorder(borderRadius: _buttonRadius),
          textStyle: AppTextStyle.bodyMedium,
        ),
      ),

      // ================= TEXT BUTTON =================
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: scheme.primary,
          shape: const RoundedRectangleBorder(borderRadius: _buttonRadius),
          textStyle: AppTextStyle.bodyMedium,
        ),
      ),

      // ================= INPUTS =================
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surfaceVariant,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSizes.medium,
          vertical: AppSizes.small,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusLarge),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusLarge),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusLarge),
          borderSide: BorderSide(color: scheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusLarge),
          borderSide: BorderSide(color: scheme.error),
        ),
        hintStyle: AppTextStyle.bodyMedium.copyWith(
          color: scheme.onSurfaceVariant,
        ),
      ),

      // ================= FAB =================
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        elevation: 0,
        shape: const CircleBorder(),
      ),

      // ================= SWITCH =================
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.selected)
              ? scheme.primary
              : scheme.outline;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.selected)
              ? scheme.primary.withOpacity(0.4)
              : scheme.surfaceVariant;
        }),
      ),

      // ================= CHECKBOX =================
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.selected)
              ? scheme.primary
              : Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(scheme.onPrimary),
        side: BorderSide(color: scheme.outline),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
        ),
      ),

      // ================= DIVIDER =================
      dividerTheme: DividerThemeData(
        color: scheme.outline,
        thickness: 1,
        space: AppSizes.medium,
      ),

      // ================= BOTTOM NAV =================
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: scheme.surface,
        selectedItemColor: scheme.primary,
        unselectedItemColor: scheme.onSurfaceVariant,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),

      // ================= BOTTOM SHEET =================
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: scheme.surface,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSizes.radiusLarge),
          ),
        ),
      ),
    );
  }
}
