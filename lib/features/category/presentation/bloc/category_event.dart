import 'package:equatable/equatable.dart';
import 'package:spently/core/shared/enums/category_type/app_category_type.dart';
import 'package:spently/features/category/domain/entities/category_entity.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object?> get props => [];
}

class LoadCategoryEvent extends CategoryEvent {
  final CategoryType? type;

  const LoadCategoryEvent({this.type});

  @override
  List<Object?> get props => [type];
}

class LoadCategoriesEvent extends CategoryEvent {
  final CategoryType? type;

  const LoadCategoriesEvent({this.type});

  @override
  List<Object?> get props => [type];
}

class CreateCategoryEvent extends CategoryEvent {
  final CategoryEntity category;

  const CreateCategoryEvent({required this.category});

  @override
  List<Object?> get props => [category];
}

class UpdateCategoryEvent extends CategoryEvent {
  final CategoryEntity category;

  const UpdateCategoryEvent({required this.category});

  @override
  List<Object?> get props => [category];
}

class ReorderCategoriesEvent extends CategoryEvent {
  final List<CategoryEntity> categories;

  const ReorderCategoriesEvent(this.categories);

  @override
  List<Object?> get props => [categories];
}

class DeleteCategoryEvent extends CategoryEvent {
  final String categoryId;

  const DeleteCategoryEvent({required this.categoryId});

  @override
  List<Object?> get props => [categoryId];
}

class SeedDefaultCategoriesEvent extends CategoryEvent {
  const SeedDefaultCategoriesEvent();

  @override
  List<Object?> get props => [];
}
