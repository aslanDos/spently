import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension BuildContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  TextTheme get textTheme => theme.textTheme;

  DefaultTextStyle get defaultTextStyle => DefaultTextStyle.of(this);

  bool get isDarkMode => theme.brightness == Brightness.dark;

  double get screenWidth => MediaQuery.sizeOf(this).width;

  double get screenHeight => MediaQuery.sizeOf(this).height;

  EdgeInsets get padding => MediaQuery.paddingOf(this);

  GoRouter get goRouter => GoRouter.of(this);

  NavigatorState get navigator => Navigator.of(this);

  // COLORS

  // === Brand ===
  Color get primary => colorScheme.primary;
  Color get onPrimary => colorScheme.onPrimary;

  // === Backgrounds ===
  Color get surface => colorScheme.surface;

  // === Text ===
  Color get textPrimary => colorScheme.onSurface;
  Color get textSecondary => colorScheme.onSurfaceVariant;

  // === Borders / Outline ===
  Color get border => colorScheme.outline;

  // === Status ===
  Color get error => colorScheme.error;
  Color get success => colorScheme.primary;
  Color get warning => colorScheme.primary;

  // === Inverse ===
  Color get inverseSurface => colorScheme.inverseSurface;
}
