import 'package:flutter/material.dart';
import 'package:spently/core/constants/app_icon_sizes.dart';
import 'package:spently/core/constants/app_radius.dart';
import 'package:spently/core/shared/mappers/app_icon_mapper.dart';
import 'package:spently/features/category/domain/entities/category_entity.dart';

class CategoryChip extends StatelessWidget {
  final CategoryEntity category;
  final bool isSelected;
  final double? size;

  const CategoryChip({
    super.key,
    required this.category,
    required this.isSelected,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    final categoryColor = category.backgroundColor;
    final baseSize = size ?? 56.0;
    final chipSize = isSelected ? baseSize + 8 : baseSize;
    final iconSize = isSelected ? AppIconSizes.medium : AppIconSizes.small;
    final borderRadius = chipSize < 40
        ? AppRadius.radius12
        : AppRadius.radius16;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
      width: chipSize,
      height: chipSize,
      decoration: BoxDecoration(
        color: categoryColor.withValues(alpha: isSelected ? 0.7 : 0.4),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(
        child: Icon(
          category.iconType.icon,
          color: categoryColor,
          size: iconSize,
        ),
      ),
    );
  }
}
