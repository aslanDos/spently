import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spently/core/usecases/usecase.dart';
import 'package:spently/features/category/presentation/bloc/category_event.dart';
import 'package:spently/features/category/presentation/bloc/category_state.dart';

import '../../domain/usecases/category_usecases.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategoriesUseCase _getCategories;
  final CreateCategoryUseCase _createCategory;
  final UpdateCategoryUseCase _updateCategory;
  final UpdateCategoriesOrderUseCase _updateCategoriesOrder;
  final DeleteCategoryUseCase _deleteCategory;
  final SeedDefaultCategoriesUseCase _seedDefaultCategories;

  CategoryBloc({
    required GetCategoriesUseCase getCategories,
    required CreateCategoryUseCase createCategory,
    required UpdateCategoryUseCase updateCategory,
    required UpdateCategoriesOrderUseCase updateCategoriesOrder,
    required DeleteCategoryUseCase deleteCategory,
    required SeedDefaultCategoriesUseCase seedDefaultCategories,
  }) : _getCategories = getCategories,
       _createCategory = createCategory,
       _updateCategory = updateCategory,
       _updateCategoriesOrder = updateCategoriesOrder,
       _deleteCategory = deleteCategory,
       _seedDefaultCategories = seedDefaultCategories,
       super(CategoryInitial()) {
    on<LoadCategoriesEvent>(_onLoadCategories);
    on<CreateCategoryEvent>(_onCreateCategory);
    on<UpdateCategoryEvent>(_onUpdateCategory);
    on<ReorderCategoriesEvent>(_onReorderCategories);
    on<DeleteCategoryEvent>(_onDeleteCategory);
    on<SeedDefaultCategoriesEvent>(_onSeedDefaultCategories);
  }

  Future<void> _onLoadCategories(
    LoadCategoriesEvent event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());

    final existing = await _getCategories(GetCategoriesParams());

    await existing.fold((failure) async => emit(CategoryError(failure.msg)), (
      categories,
    ) async {
      if (categories.isEmpty) {
        await _seedDefaultCategories(NoParams());
      }

      final result = await _getCategories(
        GetCategoriesParams(type: event.type),
      );

      result.fold((failure) => emit(CategoryError(failure.msg)), (loaded) {
        emit(CategoriesLoaded(loaded));
      });
    });
  }
  // ) async {
  //   emit(CategoryLoading());

  //   final result = await _getCategories(event.type);

  //   result.fold(
  //     (failure) => emit(CategoryError(failure.msg)),
  //     (loadedCategories) => emit(CategoriesLoaded(loadedCategories)),
  //   );
  // }

  Future<void> _onCreateCategory(
    CreateCategoryEvent event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());

    final result = await _createCategory(
      CreateCategoryParams(
        name: event.name,
        type: event.type,
        icon: event.icon,
        color: event.color,
        order: event.order,
      ),
    );

    result.fold(
      (failure) => emit(CategoryError(failure.msg)),
      (category) => emit(CategoryCreated(category)),
    );
  }

  Future<void> _onUpdateCategory(
    UpdateCategoryEvent event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());

    final result = await _updateCategory(event.category);

    result.fold(
      (failure) => emit(CategoryError(failure.msg)),
      (category) => emit(CategoryUpdated(category)),
    );
  }

  Future<void> _onReorderCategories(
    ReorderCategoriesEvent event,
    Emitter<CategoryState> emit,
  ) async {
    if (state is! CategoriesLoaded) return;

    final currentState = state as CategoriesLoaded;

    final updatedList = [
      for (int i = 0; i < event.categories.length; i++)
        event.categories[i].copyWith(order: i),
    ];

    final newAllCategories = currentState.categories.map((category) {
      final updated = updatedList.firstWhere(
        (c) => c.id == category.id,
        orElse: () => category,
      );
      return updated;
    }).toList();

    emit(CategoriesLoaded(newAllCategories));

    await _updateCategoriesOrder(updatedList);
  }

  Future<void> _onDeleteCategory(
    DeleteCategoryEvent event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());

    final result = await _deleteCategory(event.categoryId);

    result.fold(
      (failure) => emit(CategoryError(failure.msg)),
      (_) => emit(CategoryDeleted(event.categoryId)),
    );
  }

  Future<void> _onSeedDefaultCategories(
    SeedDefaultCategoriesEvent event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());

    final result = await _seedDefaultCategories(NoParams());

    result.fold(
      (failure) => emit(CategoryError(failure.msg)),
      (_) => emit(DefaultCategoriesSeeded()),
    );
  }
}
