import 'package:dartz/dartz.dart';
import 'package:spently/core/errors/failures.dart';
import 'package:spently/core/shared/enums/category_type/app_category_type.dart';
import 'package:spently/features/category/domain/entities/category_entity.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, List<CategoryEntity>>> getCategoriesByType(
    CategoryType type,
  );
  Future<Either<Failure, CategoryEntity>> createCategory(
    CategoryEntity category,
  );
  Future<Either<Failure, CategoryEntity>> updateCategory(
    CategoryEntity category,
  );

  Future<Either<Failure, void>> updateCategoriesOrder(
    List<CategoryEntity> categories,
  );

  Future<Either<Failure, void>> deleteCategory(String categoryId);

  Future<Either<Failure, void>> seedDefaultCategories();
}
