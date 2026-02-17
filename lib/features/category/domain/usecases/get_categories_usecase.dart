import 'package:dartz/dartz.dart';
import 'package:spently/core/errors/failures.dart';
import 'package:spently/core/shared/enums/category_type/app_category_type.dart';
import 'package:spently/core/usecases/usecase.dart';
import 'package:spently/features/category/domain/entities/category_entity.dart';
import 'package:spently/features/category/domain/repository/category_repository.dart';

class GetCategoriesUseCase
    extends UseCase<List<CategoryEntity>, CategoryType?> {
  final CategoryRepository repository;

  GetCategoriesUseCase(this.repository);

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(CategoryType? type) {
    if (type != null) {
      return repository.getCategoriesByType(type);
    }
    return repository.getCategories();
  }
}
