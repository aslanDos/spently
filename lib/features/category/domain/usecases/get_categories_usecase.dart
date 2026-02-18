import 'package:dartz/dartz.dart';
import 'package:spently/core/errors/failures.dart';
import 'package:spently/core/shared/enums/category_type/app_category_type.dart';
import 'package:spently/core/usecases/usecase.dart';
import 'package:spently/features/category/domain/entities/category_entity.dart';
import 'package:spently/features/category/domain/repository/category_repository.dart';

class GetCategoriesUseCase
    extends UseCase<List<CategoryEntity>, GetCategoriesParams> {
  final CategoryRepository repository;

  GetCategoriesUseCase(this.repository);

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(
    GetCategoriesParams params,
  ) {
    if (params.type != null) {
      return repository.getCategoriesByType(params.type!);
    }
    return repository.getCategories();
  }
}

class GetCategoriesParams {
  final CategoryType? type;

  const GetCategoriesParams({this.type});
}
