import 'package:dartz/dartz.dart';
import 'package:spently/core/errors/failures.dart';
import 'package:spently/core/shared/enums/category_type/app_category_type.dart';
import 'package:spently/core/usecases/usecase.dart';
import 'package:spently/core/utils/id_generator.dart';
import 'package:spently/features/category/domain/entities/category_entity.dart';
import 'package:spently/features/category/domain/repository/category_repository.dart';

class CreateCategoryUseCase
    extends UseCase<CategoryEntity, CreateCategoryParams> {
  final CategoryRepository repository;
  final IdGenerator idGenerator;

  CreateCategoryUseCase(this.repository, this.idGenerator);

  @override
  Future<Either<Failure, CategoryEntity>> call(CreateCategoryParams params) {
    if (params.name.trim().isEmpty) {
      return Future.value(
        const Left(ValidationFailure(msg: 'Category name cannot be empty')),
      );
    }

    final now = DateTime.now();

    final category = CategoryEntity(
      id: idGenerator.generate(),
      name: params.name.trim(),
      type: params.type,
      icon: params.icon,
      color: params.color,
      isDefault: false,
      createdAt: now,
      updatedAt: now,
      order: params.order,
      isVisible: true,
    );

    return repository.createCategory(category);
  }
}

class CreateCategoryParams {
  final String name;
  final CategoryType type;
  final String icon;
  final String color;
  final int order;

  const CreateCategoryParams({
    required this.name,
    required this.type,
    required this.icon,
    required this.color,
    required this.order,
  });
}
