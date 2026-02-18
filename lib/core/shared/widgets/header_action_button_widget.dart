import 'package:flutter/material.dart';
import 'package:spently/core/constants/app_colors.dart';

class HeaderActionButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback onTap;
  final int? size;

  const HeaderActionButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.size = 44,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size?.toDouble(),
        height: size?.toDouble(),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: context.border),
        ),
        child: icon,
      ),
    );
  }
}
