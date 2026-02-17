import 'package:hive/hive.dart';
import 'package:spently/core/services/hive_service.dart';
import 'package:spently/core/shared/enums/category_type/app_category_type.dart';
import 'package:spently/features/category/data/data_source/category_local_data_source.dart';
import 'package:spently/features/category/data/models/category_model.dart';

class CategoryLocalDataSourceImpl implements CategoryLocalDataSource {
  final HiveService _hiveService;
  CategoryLocalDataSourceImpl(this._hiveService);

  Box<CategoryModel>? _box;

  Future<Box<CategoryModel>> _getBox() async {
    _box ??= await _hiveService.openBox<CategoryModel>(
      HiveService.categoriesBox,
    );
    return _box!;
  }

  @override
  Future<void> clearCategories() async {
    final box = await _getBox();
    box.clear();
  }

  @override
  Future<void> deleteCategory(String categoryId) async {
    final box = await _getBox();
    box.delete(categoryId);
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final box = await _getBox();
    return box.values.toList();
  }

  @override
  Future<List<CategoryModel>> getCategoriesByType(CategoryType type) async {
    final box = await _getBox();
    return box.values.where((c) => c.type == type).toList();
  }

  @override
  Future<void> saveCategories(List<CategoryModel> categories) async {
    final box = await _getBox();
    final map = {for (var c in categories) c.id: c};
    await box.putAll(map);
  }

  @override
  Future<void> saveCategory(CategoryModel category) async {
    final box = await _getBox();
    box.put(category.id, category);
  }
}
