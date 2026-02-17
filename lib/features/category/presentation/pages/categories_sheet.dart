import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spently/core/constants/app_colors.dart';
import 'package:spently/core/constants/app_sizes.dart';
import 'package:spently/features/category/domain/entities/category_entity.dart';
import 'package:spently/features/category/presentation/bloc/category_bloc.dart';
import 'package:spently/features/category/presentation/bloc/category_event.dart';
import 'package:spently/features/category/presentation/bloc/category_state.dart';
import 'package:spently/features/category/presentation/widgets/category_card_widget.dart';
import 'package:spently/features/category/presentation/widgets/category_header_widget.dart';
import 'package:spently/features/category/presentation/widgets/type_toggle_widget.dart';

class CategoriesSheet extends StatefulWidget {
  const CategoriesSheet({super.key});

  static Future<bool?> show(BuildContext context) {
    final categoryBloc = context.read<CategoryBloc>();
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black54,
      builder: (context) => BlocProvider.value(
        value: categoryBloc,
        child: const CategoriesSheet(),
      ),
    );
  }

  @override
  State<CategoriesSheet> createState() => _CategoriesSheetState();
}

class _CategoriesSheetState extends State<CategoriesSheet> {
  bool isExpense = true;

  void _closeSheet() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (context, scrollcontroller) {
        return BlocConsumer<CategoryBloc, CategoryState>(
          listener: (context, state) {
            if (state is CategoryDeleted ||
                state is CategoryCreated ||
                state is CategoryUpdated) {
              context.read<CategoryBloc>().add(LoadCategoriesEvent());
            } else if (state is CategoryError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: context.surface,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(AppSizes.radiusTwoXLarge),
                  ),
                ),
                child: Column(
                  children: [
                    buildCategoryHeader(onClose: _closeSheet, context: context),

                    /// Type toggle
                    TypeToggle(
                      isExpense: isExpense,
                      onChanged: (value) {
                        setState(() {
                          isExpense = value;
                        });
                      },
                    ),
                    _buildContent(context, state, scrollcontroller),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildContent(
    BuildContext context,
    CategoryState state,
    ScrollController scrollController,
  ) {
    if (state is CategoryLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is! CategoriesLoaded) {
      return const SizedBox();
    }

    final categories = isExpense
        ? state.expenseCategories
        : state.incomeCategories;

    if (categories.isEmpty) {
      return const Center(child: Text("Нет категорий"));
    }

    return Expanded(
      child: ReorderableListView.builder(
        scrollController: scrollController,
        itemCount: categories.length,
        buildDefaultDragHandles: false,
        onReorder: (oldIndex, newIndex) {
          if (newIndex > oldIndex) newIndex--;

          final state = context.read<CategoryBloc>().state;

          if (state is CategoriesLoaded) {
            final list = isExpense
                ? List<CategoryEntity>.from(state.expenseCategories)
                : List<CategoryEntity>.from(state.incomeCategories);

            final item = list.removeAt(oldIndex);
            list.insert(newIndex, item);

            context.read<CategoryBloc>().add(ReorderCategoriesEvent(list));
          }
        },
        itemBuilder: (BuildContext context, int index) {
          final category = categories[index];
          return Container(
            key: ValueKey(category.id),
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: context.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: context.border),
            ),
            child: CategoryCard(category: category, index: index),
          );
        },
      ),
    );
  }
}
