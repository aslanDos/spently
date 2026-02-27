import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spently/core/constants/app_radius.dart';
import 'package:spently/core/constants/app_spacing.dart';
import 'package:spently/core/shared/enums/icon_category/app_icon_category.dart';
import 'package:spently/core/shared/enums/icon_type/app_icon_type.dart';
import 'package:spently/core/shared/mappers/app_icon_category_mapper.dart';
import 'package:spently/core/shared/mappers/app_icon_mapper.dart';

class IconPicker extends StatefulWidget {
  final AppIconType? selectedIcon;
  final ValueChanged<AppIconType> onIconSelected;

  const IconPicker({
    super.key,
    required this.selectedIcon,
    required this.onIconSelected,
  });

  @override
  State<IconPicker> createState() => _IconPickerState();
}

class _IconPickerState extends State<IconPicker> {
  static const double _cellSize = 44.0;
  static const double _cellSpacing = 12.0;
  static const int _maxRows = 4;

  /// How many columns are needed so all icons fit within [_maxRows] rows.
  /// e.g. 10 icons → ceil(10/4) = 3 columns → 3 rows of 3 + 1 row of 1 ✓
  int _crossAxisCount(int iconCount) => (iconCount / _maxRows).ceil();

  /// Exact pixel width for a column with [cols] cells.
  double _columnWidth(int cols) => cols * _cellSize + (cols - 1) * _cellSpacing;

  /// Exact pixel height for [rows] rows of cells.
  double _gridHeight(int rows) => rows * _cellSize + (rows - 1) * _cellSpacing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppRadius.radius12),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spacing16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: IconCategory.values.map((category) {
            final icons = AppIconType.values
                .where((e) => e.category == category)
                .toList();

            if (icons.isEmpty) return const SizedBox.shrink();

            return Padding(
              padding: const EdgeInsets.only(right: AppSpacing.spacing24),
              child: _buildCategoryColumn(category, icons),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildCategoryTitle(IconCategory category) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        category.name.toUpperCase(),
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildCategoryColumn(IconCategory category, List<AppIconType> icons) {
    final cols = _crossAxisCount(icons.length);
    final rows = (icons.length / cols).ceil();
    final colWidth = _columnWidth(cols);
    final gridH = _gridHeight(rows);

    return SizedBox(
      width: colWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildCategoryTitle(category),
          const SizedBox(height: 12),
          SizedBox(
            width: colWidth,
            height: gridH,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: icons.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: cols,
                mainAxisSpacing: _cellSpacing,
                crossAxisSpacing: _cellSpacing,
                mainAxisExtent: _cellSize,
              ),
              itemBuilder: (context, index) {
                final iconType = icons[index];
                final isSelected = widget.selectedIcon == iconType;

                return GestureDetector(
                  onTap: () => widget.onIconSelected(iconType),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.black
                          : Colors.grey.withValues(alpha: 0.08),
                      border: Border.all(
                        color: isSelected
                            ? Colors.black
                            : Colors.grey.withValues(alpha: 0.25),
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: FaIcon(
                        iconType.icon,
                        size: 18,
                        color: isSelected ? Colors.white : Colors.grey.shade700,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
