import 'package:flutter/material.dart';
import 'package:spently/core/constants/app_colors.dart';
import 'package:spently/core/constants/app_radius.dart';
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

  // Common border radius, independent of color scheme
  static const double defaultRadius = AppRadius.radius24;
  static const BorderRadius defaultBorderRadius = BorderRadius.all(
    Radius.circular(defaultRadius),
  );
  static const BorderRadius cardBorderRadius = BorderRadius.all(
    Radius.circular(AppRadius.radius12),
  );
  static const BorderRadius buttonBorderRadius = BorderRadius.all(
    Radius.circular(AppRadius.radius28),
  );
  static const BorderRadius inputBorderRadius = BorderRadius.all(
    Radius.circular(AppRadius.radius24),
  );

  static const List<BoxShadow> defaultBoxShadow = <BoxShadow>[
    BoxShadow(
      color: AppColors.backgroundDark,
      offset: Offset(0, 6),
      blurRadius: 16,
    ),
  ];

  static ThemeData _buildTheme(ColorScheme scheme) {
    final AppBarTheme appBarTheme = AppBarTheme(
      backgroundColor: scheme.surface,
      foregroundColor: scheme.onSurface,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      titleTextStyle: AppTextStyle.titleLarge.copyWith(
        color: scheme.onSurface,
        fontWeight: AppFontWeight.semiBold,
      ),
    );

    final CardThemeData cardTheme = CardThemeData(
      color: scheme.surfaceContainer,
      elevation: 0,
      shape: const RoundedRectangleBorder(borderRadius: cardBorderRadius),
      margin: const EdgeInsets.all(AppSizes.xSmall),
    );

    final ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.primary,
        shape: const RoundedRectangleBorder(borderRadius: buttonBorderRadius),
        padding: EdgeInsets.zero,
        textStyle: AppTextStyle.bodyMedium.copyWith(
          fontWeight: AppFontWeight.semiBold,
        ),
      ),
    );

    final OutlinedButtonThemeData outlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.zero,
        textStyle: AppTextStyle.bodyMedium.copyWith(
          fontWeight: AppFontWeight.semiBold,
        ),
        foregroundColor: scheme.onSurface,
        side: BorderSide(color: scheme.outlineVariant),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.radius12)),
        ),
      ),
    );

    final TextButtonThemeData textButtonTheme = TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: scheme.primary,
        shape: const RoundedRectangleBorder(borderRadius: buttonBorderRadius),
        padding: EdgeInsets.zero,
        textStyle: AppTextStyle.bodyMedium.copyWith(
          fontWeight: AppFontWeight.semiBold,
        ),
      ),
    );

    final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
      filled: true,
      fillColor: scheme.surfaceContainer,
      border: const OutlineInputBorder(
        borderRadius: inputBorderRadius,
        borderSide: BorderSide.none,
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: inputBorderRadius,
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: inputBorderRadius,
        borderSide: BorderSide(color: scheme.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: inputBorderRadius,
        borderSide: BorderSide(color: scheme.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: inputBorderRadius,
        borderSide: BorderSide(color: scheme.error, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSizes.medium,
        vertical: AppSizes.small,
      ),
      hintStyle: AppTextStyle.bodyMedium.copyWith(
        color: scheme.onSurfaceVariant,
      ),
    );

    final SwitchThemeData switchTheme = SwitchThemeData(
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
    );

    final FloatingActionButtonThemeData FABTheme =
        FloatingActionButtonThemeData(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          elevation: 0,
          shape: const CircleBorder(),
        );

    final CheckboxThemeData checkBoxTheme = CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        return states.contains(WidgetState.selected)
            ? scheme.primary
            : Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(scheme.onPrimary),
      side: BorderSide(color: scheme.outline),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.radius4),
      ),
    );

    final DividerThemeData dividerTheme = DividerThemeData(
      color: scheme.outline,
      thickness: 1,
      space: AppSizes.medium,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      brightness: scheme.brightness,
      textTheme: _textTheme,
      scaffoldBackgroundColor: scheme.surface,
      visualDensity: VisualDensity.adaptivePlatformDensity,

      // ================= APP BAR =================
      appBarTheme: appBarTheme,

      // ================= CARD =================
      cardTheme: cardTheme,

      // ================= ELEVATED BUTTON =================
      elevatedButtonTheme: elevatedButtonTheme,

      // ================= OUTLINED BUTTON =================
      outlinedButtonTheme: outlinedButtonTheme,

      // ================= TEXT BUTTON =================
      textButtonTheme: textButtonTheme,

      // ================= INPUTS =================
      inputDecorationTheme: inputDecorationTheme,

      // ================= FAB =================
      floatingActionButtonTheme: FABTheme,

      // ================= SWITCH =================
      switchTheme: switchTheme,

      // ================= CHECKBOX =================
      checkboxTheme: checkBoxTheme,

      // ================= DIVIDER =================
      dividerTheme: dividerTheme,
    );
  }
}
