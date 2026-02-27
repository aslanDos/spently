import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spently/core/shared/mappers/app_icon_mapper.dart';
import 'package:spently/features/category/domain/entities/category_entity.dart';

Widget buildCategoryIconChip({
  required BuildContext context,
  required CategoryEntity category,
  double? size,
}) {
  print('Category: ${category.name}, icon: ${category.icon}');
  return Container(
    margin: EdgeInsets.only(right: 12),
    width: size ?? 44,
    height: size ?? 44,
    decoration: BoxDecoration(
      color: category.backgroundColor.withValues(alpha: .5),
      borderRadius: BorderRadius.circular(14),
    ),
    child: Icon(
      category.iconType.icon,
      size: 20,
      color: category.backgroundColor,
    ),
  );
}
