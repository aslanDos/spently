import 'package:dartz/dartz.dart';
import 'package:spently/core/errors/failures.dart';
import 'package:spently/core/usecases/usecase.dart';
import 'package:spently/features/category/domain/entities/category_entity.dart';
import 'package:spently/features/category/domain/repository/category_repository.dart';

class UpdateCategoriesOrderUseCase extends UseCase<void, List<CategoryEntity>> {
  final CategoryRepository repository;

  UpdateCategoriesOrderUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(List<CategoryEntity> categories) {
    return repository.updateCategoriesOrder(categories);
  }
}
