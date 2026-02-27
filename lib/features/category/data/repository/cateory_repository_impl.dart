import 'package:dartz/dartz.dart';
import 'package:spently/core/constants/app_defaults.dart';
import 'package:spently/core/errors/failures.dart';
import 'package:spently/core/shared/enums/category_type/app_category_type.dart';
import 'package:spently/features/category/data/data_source/category_local_data_source.dart';
import 'package:spently/features/category/data/models/category_model.dart';
import 'package:spently/features/category/domain/entities/category_entity.dart';
import 'package:spently/features/category/domain/repository/category_repository.dart';
import 'package:uuid/uuid.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryLocalDataSource _localDataSource;
  final Uuid _uuid;

  CategoryRepositoryImpl({
    required CategoryLocalDataSource localDataSource,
    Uuid? uuid,
  }) : _localDataSource = localDataSource,
       _uuid = uuid ?? const Uuid();

  @override
  Future<Either<Failure, CategoryEntity>> createCategory(
    CategoryEntity category,
  ) async {
    try {
      final now = DateTime.now();

      final createdCategory = category.copyWith(createdAt: now, updatedAt: now);

      final model = CategoryModel.fromEntity(createdCategory);

      await _localDataSource.saveCategory(model);

      return Right(createdCategory);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteCategory(String categoryId) async {
    try {
      await _localDataSource.deleteCategory(categoryId);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final models = await _localDataSource.getCategories();

      final categories = models
          .map((model) => model as CategoryEntity)
          .toList();

      return Right(categories);
    } catch (e) {
      return Left(CashFailure());
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategoriesByType(
    CategoryType type,
  ) async {
    try {
      final modelsByType = await _localDataSource.getCategoriesByType(type);

      final categoriesByType = modelsByType
          .map((model) => model as CategoryEntity)
          .toList();

      return Right(categoriesByType);
    } catch (e) {
      return Left(CashFailure());
    }
  }

  @override
  Future<Either<Failure, void>> seedDefaultCategories() async {
    try {
      final existingCategories = await _localDataSource.getCategories();

      if (existingCategories.isNotEmpty) {
        // TODO: Remove after migration - clear old categories with incorrect icon values
        await _localDataSource.clearCategories();

        // return const Right(null);  // Restore this line
      }

      final defaultCategories = AppDefaults(uuid: _uuid).getDefaultCategories();

      await _localDataSource.saveCategories(defaultCategories);
      return const Right(null);
    } catch (e) {
      return Left(CashFailure());
    }
  }

  @override
  Future<Either<Failure, CategoryEntity>> updateCategory(
    CategoryEntity category,
  ) async {
    try {
      final updatedCategory = category.copyWith(updatedAt: DateTime.now());

      final model = CategoryModel.fromEntity(updatedCategory);

      await _localDataSource.saveCategory(model);

      return Right(updatedCategory);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateCategoriesOrder(
    List<CategoryEntity> categories,
  ) async {
    try {
      final now = DateTime.now();

      final models = categories
          .map(
            (category) =>
                CategoryModel.fromEntity(category.copyWith(updatedAt: now)),
          )
          .toList();

      await _localDataSource.saveCategories(models);

      return const Right(null);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
