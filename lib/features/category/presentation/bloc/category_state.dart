import 'package:equatable/equatable.dart';
import 'package:spently/core/shared/enums/category_type/app_category_type.dart';
import 'package:spently/features/category/domain/entities/category_entity.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object?> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoriesLoading extends CategoryState {}

class CategoriesLoaded extends CategoryState {
  final List<CategoryEntity> categories;

  const CategoriesLoaded(this.categories);

  List<CategoryEntity> get incomeCategories {
    final list = categories
        .where((c) => c.type == CategoryType.income)
        .toList();
    list.sort((a, b) => a.order.compareTo(b.order));
    return list;
  }

  List<CategoryEntity> get expenseCategories {
    final list = categories
        .where((c) => c.type == CategoryType.expense)
        .toList();
    list.sort((a, b) => a.order.compareTo(b.order));
    return list;
  }

  List<CategoryEntity> get visibleIncomeCategories =>
      incomeCategories.where((c) => c.isVisible).toList();

  List<CategoryEntity> get visibleExpenseCategories =>
      expenseCategories.where((c) => c.isVisible).toList();

  @override
  List<Object?> get props => [categories];
}

class CategoryCreated extends CategoryState {
  final CategoryEntity category;

  const CategoryCreated(this.category);

  @override
  List<Object?> get props => [category];
}

class CategoryUpdated extends CategoryState {
  final CategoryEntity category;

  const CategoryUpdated(this.category);

  @override
  List<Object?> get props => [category];
}

class CategoryDeleted extends CategoryState {
  final String categoryId;

  const CategoryDeleted(this.categoryId);

  @override
  List<Object?> get props => [categoryId];
}

class CategoryError extends CategoryState {
  final String message;

  const CategoryError(this.message);

  @override
  List<Object?> get props => [message];
}

class DefaultCategoriesSeeded extends CategoryState {}
