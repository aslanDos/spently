import 'package:dartz/dartz.dart';
import 'package:spently/core/errors/failures.dart';
import 'package:spently/core/usecases/usecase.dart';
import 'package:spently/features/category/domain/repository/category_repository.dart';

class DeleteCategoryUseCase extends UseCase<void, String> {
  final CategoryRepository repository;

  DeleteCategoryUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(String categoryId) {
    return repository.deleteCategory(categoryId);
  }
}
