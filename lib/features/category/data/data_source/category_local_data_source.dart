import 'package:spently/core/shared/enums/category_type/app_category_type.dart';
import 'package:spently/features/category/data/models/category_model.dart';

abstract class CategoryLocalDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<CategoryModel>> getCategoriesByType(CategoryType type);
  Future<void> saveCategory(CategoryModel category);
  Future<void> saveCategories(List<CategoryModel> categories);
  Future<void> deleteCategory(String categoryId);
  Future<void> clearCategories();
}
