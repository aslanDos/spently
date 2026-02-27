import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spently/core/shared/enums/transaction_type/app_transaction_type.dart';
import 'package:spently/core/shared/widgets/app_sheet.dart';
import 'package:spently/core/shared/widgets/type_toggle_widget.dart';
import 'package:spently/features/category/domain/entities/category_entity.dart';
import 'package:spently/features/category/presentation/bloc/category_bloc.dart';
import 'package:spently/features/category/presentation/bloc/category_event.dart';
import 'package:spently/features/category/presentation/bloc/category_state.dart';
import 'package:spently/features/category/presentation/widgets/category_card_widget.dart';
import 'package:spently/features/category/presentation/widgets/category_header_widget.dart';

class CategoriesSheet extends StatefulWidget {
  const CategoriesSheet({super.key});

  static Future<bool?> show(BuildContext context) {
    return AppSheet.show(
      context: context,
      child: const CategoriesSheet(),
      initialChildSize: 0.9,
      minChildSize: 0.9,
      maxChildSize: 0.9,
    );
  }

  @override
  State<CategoriesSheet> createState() => _CategoriesSheetState();
}

class _CategoriesSheetState extends State<CategoriesSheet> {
  TransactionType selectedType = TransactionType.income;

  void _closeSheet() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
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
        return Column(
          children: [
            buildCategoryHeader(onClose: _closeSheet, context: context),

            /// Type toggle
            TypeToggle(
              selected: selectedType,
              items: const [
                TransactionType.income,
                TransactionType.expense,
              ],
              onChanged: (value) {
                setState(() {
                  selectedType = value;
                });
              },
            ),

            SizedBox(height: 20),

            _buildContent(context, state),
          ],
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, CategoryState state) {
    if (state is CategoryLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is! CategoriesLoaded) {
      return const SizedBox();
    }

    final categories = selectedType == TransactionType.expense
        ? state.expenseCategories
        : state.incomeCategories;

    if (categories.isEmpty) {
      return const Center(child: Text("No categories"));
    }

    return Expanded(
      child: ReorderableListView.builder(
        itemCount: categories.length,
        buildDefaultDragHandles: false,
        onReorder: (oldIndex, newIndex) {
          if (newIndex > oldIndex) newIndex--;

          final state = context.read<CategoryBloc>().state;

          if (state is CategoriesLoaded) {
            final list = selectedType == TransactionType.expense
                ? List<CategoryEntity>.from(state.expenseCategories)
                : List<CategoryEntity>.from(state.incomeCategories);

            final item = list.removeAt(oldIndex);
            list.insert(newIndex, item);

            context.read<CategoryBloc>().add(ReorderCategoriesEvent(list));
          }
        },
        proxyDecorator: (child, index, animation) => child,
        itemBuilder: (BuildContext context, int index) {
          final category = categories[index];
          return Column(
            key: ValueKey(category.id),
            children: [
              CategoryCard(category: category, index: index),
              const SizedBox(height: 5),
            ],
          );
        },
      ),
    );
  }
}
