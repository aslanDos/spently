import 'package:flutter/material.dart';
import 'package:spently/features/category/domain/entities/category_entity.dart';
import 'package:spently/features/category/presentation/widgets/category_icon_chip.dart';

class CategoryCard extends StatelessWidget {
  final CategoryEntity category;
  final int index;
  const CategoryCard({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Icon
        buildCategoryIconChip(context: context, category: category),

        // Title
        Expanded(
          child: Text(
            category.name,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),

        // Drag Handler
        ReorderableDragStartListener(
          index: index,
          child: const Icon(Icons.drag_indicator, color: Colors.grey),
        ),
      ],
    );
  }
}
