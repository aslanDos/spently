import 'package:get_it/get_it.dart';
import 'package:spently/core/services/hive_service.dart';
import 'package:spently/features/account/data/data_source/account_local_data_source.dart';
import 'package:spently/features/account/data/data_source/account_local_data_source_impl.dart';
import 'package:spently/features/account/data/repository/account_repository_impl.dart';
import 'package:spently/features/account/domain/repository/account_repostiory.dart';
import 'package:spently/features/account/presentation/bloc/account_bloc.dart';
import 'package:spently/features/category/data/data_source/category_local_data_source.dart';
import 'package:spently/features/category/data/data_source/category_local_data_source_impl.dart';
import 'package:spently/features/category/data/repository/cateory_repository_impl.dart';
import 'package:spently/features/category/domain/repository/category_repository.dart';
import 'package:spently/features/category/presentation/bloc/category_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../features/account/domain/usecases/account_usecases.dart';
import '../../features/category/domain/usecases/category_usecases.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  sl.registerLazySingleton(() => const Uuid());

  // Core services
  sl.registerLazySingleton(() => HiveService());

  // Features
  _registerAccountsFeature();
  _registerCategoriesFeature();
}

void _registerAccountsFeature() {
  // Bloc
  sl.registerFactory(
    () => AccountBloc(
      getAccounts: sl<GetAccountsUseCase>(),
      getAccount: sl<GetAccountUseCase>(),
      createAccount: sl<CreateAccountUseCase>(),
      updateAccount: sl<UpdateAccountUseCase>(),
      deleteAccount: sl<DeleteAccountUseCase>(),
      updateAccountBalance: sl<UpdateAccountBalanceUseCase>(),
      seedDefaultAccount: sl<SeedDefaultAccountUseCase>(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<AccountLocalDataSource>(
    () => AccountLocalDataSourceImpl(sl<HiveService>()),
  );

  // Repository
  sl.registerLazySingleton<AccountRepository>(
    () => AccountRepositoryImpl(
      localDataSource: sl<AccountLocalDataSource>(),
      uuid: sl<Uuid>(),
    ),
  );

  // Use cases
  sl.registerLazySingleton<GetAccountsUseCase>(
    () => GetAccountsUseCase(sl<AccountRepository>()),
  );
  sl.registerLazySingleton<GetAccountUseCase>(
    () => GetAccountUseCase(sl<AccountRepository>()),
  );
  sl.registerLazySingleton<CreateAccountUseCase>(
    () => CreateAccountUseCase(sl<AccountRepository>()),
  );
  sl.registerLazySingleton<UpdateAccountUseCase>(
    () => UpdateAccountUseCase(sl<AccountRepository>()),
  );
  sl.registerLazySingleton<DeleteAccountUseCase>(
    () => DeleteAccountUseCase(sl<AccountRepository>()),
  );
  sl.registerLazySingleton<UpdateAccountBalanceUseCase>(
    () => UpdateAccountBalanceUseCase(sl<AccountRepository>()),
  );
  sl.registerLazySingleton<SeedDefaultAccountUseCase>(
    () => SeedDefaultAccountUseCase(sl<AccountRepository>()),
  );
}

void _registerCategoriesFeature() {
  // Bloc
  sl.registerFactory(
    () => CategoryBloc(
      getCategories: sl<GetCategoriesUseCase>(),
      createCategory: sl<CreateCategoryUseCase>(),
      updateCategory: sl<UpdateCategoryUseCase>(),
      updateCategoriesOrder: sl<UpdateCategoriesOrderUseCase>(),
      deleteCategory: sl<DeleteCategoryUseCase>(),
      seedDefaultCategories: sl<SeedDefaultCategoriesUseCase>(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<CategoryLocalDataSource>(
    () => CategoryLocalDataSourceImpl(sl<HiveService>()),
  );

  // Repository
  sl.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(
      localDataSource: sl<CategoryLocalDataSource>(),
      uuid: sl<Uuid>(),
    ),
  );

  // Use cases
  sl.registerLazySingleton<GetCategoriesUseCase>(
    () => GetCategoriesUseCase(sl<CategoryRepository>()),
  );
  sl.registerLazySingleton<CreateCategoryUseCase>(
    () => CreateCategoryUseCase(sl<CategoryRepository>()),
  );
  sl.registerLazySingleton<UpdateCategoryUseCase>(
    () => UpdateCategoryUseCase(sl<CategoryRepository>()),
  );
  sl.registerLazySingleton<UpdateCategoriesOrderUseCase>(
    () => UpdateCategoriesOrderUseCase(sl<CategoryRepository>()),
  );
  sl.registerLazySingleton<DeleteCategoryUseCase>(
    () => DeleteCategoryUseCase(sl<CategoryRepository>()),
  );
  sl.registerLazySingleton<SeedDefaultCategoriesUseCase>(
    () => SeedDefaultCategoriesUseCase(sl<CategoryRepository>()),
  );
}
