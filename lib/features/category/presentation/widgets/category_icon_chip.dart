import 'package:flutter/cupertino.dart';
import 'package:spently/core/shared/mappers/app_icon_mapper.dart';
import 'package:spently/features/category/domain/entities/category_entity.dart';

Widget buildCategoryIconChip({
  required BuildContext context,
  required CategoryEntity category,
  double? size,
}) {
  return Container(
    width: size ?? 44,
    height: size ?? 44,
    decoration: BoxDecoration(
      color: Color(int.parse('0xFF${category.color}')).withValues(alpha: .15),
      borderRadius: BorderRadius.circular(14),
    ),
    child: Icon(AppIconMapper.fromString(category.icon).icon(context)),
  );
}
