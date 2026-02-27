import 'package:flutter/material.dart';
import 'package:spently/core/constants/app_icon_sizes.dart';
import 'package:spently/core/constants/app_radius.dart';
import 'package:spently/core/extensions/build_context_ext.dart';
import 'package:spently/core/shared/icons/app_icons.dart';

class EmptyCategoryChip extends StatelessWidget {
  final bool isSelected;
  final double? size;

  const EmptyCategoryChip({
    super.key,
    required this.isSelected,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final baseSize = size ?? 56.0;
    final chipSize = isSelected ? baseSize + 8 : baseSize;
    final iconSize = isSelected ? AppIconSizes.medium : AppIconSizes.small;
    final borderRadius = chipSize < 40 ? AppRadius.radius12 : AppRadius.radius16;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      width: chipSize,
      height: chipSize,
      decoration: BoxDecoration(
        color: context.colorScheme.secondary.withValues(
          alpha: isSelected ? 0.5 : 0.3,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(
        child: Icon(
          AppIcons.empty,
          color: context.colorScheme.secondary,
          size: iconSize,
        ),
      ),
    );
  }
}
