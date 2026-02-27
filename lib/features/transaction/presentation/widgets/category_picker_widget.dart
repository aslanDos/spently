import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spently/core/constants/app_icon_sizes.dart';
import 'package:spently/core/constants/app_radius.dart';
import 'package:spently/core/constants/app_spacing.dart';
import 'package:spently/core/extensions/build_context_ext.dart';
import 'package:spently/core/shared/enums/transaction_type/app_transaction_type.dart';
import 'package:spently/core/shared/icons/app_icons.dart';
import 'package:spently/core/shared/widgets/category_chip_widget.dart';
import 'package:spently/core/shared/widgets/empty_category_chip.dart';
import 'package:spently/features/category/domain/entities/category_entity.dart';
import 'package:spently/features/category/presentation/bloc/category_bloc.dart';
import 'package:spently/features/category/presentation/bloc/category_state.dart';
import 'package:spently/features/category/presentation/pages/categories_sheet.dart';

class CategoryPicker extends StatefulWidget {
  final TransactionType transactionType;
  final CategoryEntity? selectedCategory;
  final ValueChanged<CategoryEntity?> onCategorySelected;

  const CategoryPicker({
    super.key,
    required this.transactionType,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  State<CategoryPicker> createState() => _CategoryPickerState();
}

class _CategoryPickerState extends State<CategoryPicker> {
  late ScrollController _scrollController;
  static const double _itemWidth = 42.0;
  static const double _itemSpacing = 4.0;
  static const double _totalItemWidth = _itemWidth + _itemSpacing;
  static const double _containerHeight = 90.0;

  int _centeredIndex = 0;
  double _containerWidth = 0;
  bool _isSnapping = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    // Scroll to selected category after first build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToSelectedCategory();
    });
  }

  void _scrollToSelectedCategory() {
    final state = context.read<CategoryBloc>().state;
    if (state is! CategoriesLoaded) return;

    final categories = widget.transactionType == TransactionType.expense
        ? state.visibleExpenseCategories
        : state.visibleIncomeCategories;

    if (widget.selectedCategory == null) {
      // Center empty chip (rawIndex 1)
      _scrollToRawIndex(1);
      return;
    }

    final index = categories.indexWhere(
      (c) => c.id == widget.selectedCategory!.id,
    );

    if (index != -1) {
      _scrollToRawIndex(index + 2);
    } else {
      _scrollToRawIndex(1);
    }
  }

  @override
  void didUpdateWidget(CategoryPicker oldWidget) {
    super.didUpdateWidget(oldWidget);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = context.read<CategoryBloc>().state;
      if (state is! CategoriesLoaded) return;

      final categories = widget.transactionType == TransactionType.expense
          ? state.visibleExpenseCategories
          : state.visibleIncomeCategories;

      // Если null → центрируем Empty (rawIndex 1)
      if (widget.selectedCategory == null) {
        _scrollToRawIndex(1);
        return;
      }

      final index = categories.indexWhere(
        (c) => c.id == widget.selectedCategory!.id,
      );

      if (index != -1) {
        _scrollToRawIndex(index + 2);
      }
    });
  }

  void _scrollToRawIndex(int rawIndex) {
    final targetOffset = rawIndex * _totalItemWidth;

    _scrollController.animateTo(
      targetOffset.clamp(0.0, _scrollController.position.maxScrollExtent),
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }

  void _handleSnap(List<CategoryEntity> categories) {
    if (!_scrollController.hasClients || _isSnapping) return;

    final rawIndex = (_scrollController.offset / _totalItemWidth).round();

    final targetOffset = rawIndex * _totalItemWidth;

    final currentOffset = _scrollController.offset;

    // если уже почти центрировано — ничего не делаем
    if ((currentOffset - targetOffset).abs() < 0.5) {
      _selectCategory(rawIndex, categories);
      return;
    }

    _isSnapping = true;

    _scrollController
        .animateTo(
          targetOffset.clamp(0.0, _scrollController.position.maxScrollExtent),
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        )
        .then((_) {
          _isSnapping = false;
          _selectCategory(rawIndex, categories);
        });
  }

  void _selectCategory(int rawIndex, List<CategoryEntity> categories) {
    if (rawIndex == 0) {
      // Reset selection when opening categories sheet
      widget.onCategorySelected(null);
      CategoriesSheet.show(context);
      return;
    }

    if (rawIndex == 1) {
      widget.onCategorySelected(null);
      return;
    }

    final categoryIndex = rawIndex - 2;

    setState(() {
      _centeredIndex = categoryIndex;
    });

    widget.onCategorySelected(categories[categoryIndex]);
  }

  @override
  void dispose() {
    // _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is! CategoriesLoaded) {
          return const SizedBox.shrink();
        }

        final categories = widget.transactionType == TransactionType.expense
            ? state.visibleExpenseCategories
            : state.visibleIncomeCategories;

        if (categories.isEmpty) {
          return _buildEmptyState(context);
        }

        // Update centered index if selected category changes externally
        if (widget.selectedCategory != null) {
          final selectedIndex = categories.indexWhere(
            (c) => c.id == widget.selectedCategory!.id,
          );
          if (selectedIndex != -1 && selectedIndex != _centeredIndex) {
            _centeredIndex = selectedIndex;
          }
        }

        CategoryEntity? selectedCategory;

        if (widget.selectedCategory != null) {
          final index = categories.indexWhere(
            (c) => c.id == widget.selectedCategory!.id,
          );

          if (index != -1) {
            selectedCategory = categories[index];
          }
        }

        final containerColor = context.colorScheme.secondary.withValues(
          alpha: 0.2,
        );

        return Container(
          height: _containerHeight,
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(AppRadius.radius24),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.radius24),
            child: Stack(
              children: [
                Column(
                  children: [
                    const SizedBox(height: AppSpacing.spacing16),
                    Expanded(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          _containerWidth = constraints.maxWidth;
                          final horizontalPadding =
                              (_containerWidth / 2) - (_itemWidth / 2);

                          return NotificationListener<ScrollNotification>(
                            onNotification: (notification) {
                              if (notification is ScrollEndNotification) {
                                _handleSnap(categories);
                              }
                              return false;
                            },
                            child: ListView.builder(
                              controller: _scrollController,
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.symmetric(
                                horizontal: horizontalPadding,
                              ),
                              itemCount:
                                  categories.length +
                                  2, // +2 for add button, empty button
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      right: _itemSpacing,
                                    ),
                                    child: Center(
                                      child: _buildAddChip(context),
                                    ),
                                  );
                                }

                                if (index == 1) {
                                  final isSelected =
                                      widget.selectedCategory == null;

                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      right: _itemSpacing,
                                    ),
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () {
                                          _scrollToRawIndex(1);
                                          widget.onCategorySelected(null);
                                        },
                                        child: EmptyCategoryChip(
                                          isSelected: isSelected,
                                          size: _itemWidth,
                                        ),
                                      ),
                                    ),
                                  );
                                }

                                final categoryIndex = index - 2;
                                final category = categories[categoryIndex];
                                final isSelected =
                                    widget.selectedCategory?.id == category.id;

                                return Padding(
                                  padding: const EdgeInsets.only(
                                    right: _itemSpacing,
                                  ),
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () => _scrollToIndex(
                                        categoryIndex,
                                        categories.length,
                                      ),
                                      child: CategoryChip(
                                        category: category,
                                        isSelected: isSelected,
                                        size: _itemWidth,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: AppSpacing.spacing8,
                      ),
                      child: Text(
                        selectedCategory?.name ?? 'No category',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color:
                              selectedCategory?.backgroundColor ??
                              context.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
                // Left inner shadow
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  width: 24,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          containerColor,
                          containerColor.withValues(alpha: 0),
                        ],
                      ),
                    ),
                  ),
                ),
                // Right inner shadow
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  width: 24,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          containerColor,
                          containerColor.withValues(alpha: 0),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _scrollToIndex(int categoryIndex, int totalItems) {
    // Categories start at raw index 2 (after add button at 0, empty chip at 1)
    _scrollToRawIndex(categoryIndex + 2);
  }

  Widget _buildAddChip(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onCategorySelected(null);
        CategoriesSheet.show(context);
      },
      child: Container(
        width: _itemWidth,
        height: _itemWidth,
        decoration: BoxDecoration(
          color: context.colorScheme.secondary.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(AppRadius.radius12),
        ),
        child: Center(
          child: Icon(
            AppIcons.add,
            color: context.primary,
            size: AppIconSizes.small,
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return GestureDetector(
      onTap: () => CategoriesSheet.show(context),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.spacing16),
        decoration: BoxDecoration(
          color: context.colorScheme.secondary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(AppRadius.radius16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              AppIcons.add,
              color: context.primary,
              size: AppIconSizes.small,
            ),
            const SizedBox(width: AppSpacing.spacing8),
            Text('Add category', style: context.textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
