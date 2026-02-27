import 'dart:ui';

extension HexColorMapper on String {
  Color toColor() {
    final hex = replaceAll('#', '');
    return Color(int.parse(hex.length == 6 ? 'FF$hex' : hex, radix: 16));
  }
}

extension ColorToHex on Color {
  String toHex() {
    // Flutter 3.10+: r, g, b return 0.0-1.0 doubles, so multiply by 255
    final red = (r * 255).round();
    final green = (g * 255).round();
    final blue = (b * 255).round();

    return '${red.toRadixString(16).padLeft(2, '0')}'
        '${green.toRadixString(16).padLeft(2, '0')}'
        '${blue.toRadixString(16).padLeft(2, '0')}'
        .toUpperCase();
  }
}
