import 'package:dartz/dartz.dart';
import 'package:spently/core/errors/failures.dart';
import 'package:spently/core/usecases/usecase.dart';
import 'package:spently/features/category/domain/entities/category_entity.dart';
import 'package:spently/features/category/domain/repository/category_repository.dart';

class CreateCategoryUseCase extends UseCase<CategoryEntity, CategoryEntity> {
  final CategoryRepository repository;

  CreateCategoryUseCase(this.repository);

  @override
  Future<Either<Failure, CategoryEntity>> call(CategoryEntity category) {
    if (category.name.trim().isEmpty) {
      return Future.value(
        const Left(ValidationFailure(msg: 'Category name cannot be empty')),
      );
    }
    return repository.createCategory(category);
  }
}
