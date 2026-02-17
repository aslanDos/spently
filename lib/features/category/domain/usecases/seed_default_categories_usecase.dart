import 'package:dartz/dartz.dart';
import 'package:spently/core/errors/failures.dart';
import 'package:spently/core/usecases/usecase.dart';
import 'package:spently/features/category/domain/repository/category_repository.dart';

class SeedDefaultCategoriesUseCase extends UseCase<void, NoParams> {
  final CategoryRepository repository;

  SeedDefaultCategoriesUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return repository.seedDefaultCategories();
  }
}
