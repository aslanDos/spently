import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spently/core/router/router.dart';
import 'package:spently/core/services/hive_service.dart';
import 'package:spently/core/theme/theme.dart';
import 'package:spently/core/di/dependency_injection.dart' as di;
import 'package:spently/features/account/data/models/account_model.dart';
import 'package:spently/features/account/presentation/bloc/account_bloc.dart';
import 'package:spently/features/account/presentation/bloc/account_event.dart';
import 'package:spently/features/category/data/models/category_model.dart';
import 'package:spently/features/category/presentation/bloc/category_bloc.dart';
import 'package:spently/features/category/presentation/bloc/category_event.dart';
import 'package:spently/features/transaction/data/models/transaction_model.dart';
import 'package:spently/features/transaction/presentation/bloc/transaction_bloc.dart';
import 'package:spently/features/transaction/presentation/bloc/transaction_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  // Initialize Hive
  final hiveService = di.sl<HiveService>();
  await hiveService.init();
  hiveService.registerAdapters();

  // TODO: Remove after migration - clears old data without 'order' field
  // await hiveService.deleteBox(HiveService.accountsBox);
  // await hiveService.deleteBox(HiveService.categoriesBox);

  await hiveService.openBox<AccountModel>(HiveService.accountsBox);
  await hiveService.openBox<CategoryModel>(HiveService.categoriesBox);
  await hiveService.openBox<TransactionModel>(HiveService.transactionBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<AccountBloc>()..add(LoadAccountsEvent()),
        ),
        BlocProvider(
          create: (context) =>
              di.sl<TransactionBloc>()..add(LoadTransactionsEvent()),
        ),
        BlocProvider(
          create: (context) =>
              di.sl<CategoryBloc>()..add(LoadCategoriesEvent()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        title: 'Spently',
        routerConfig: AppRouter.router,
      ),
    );
  }
}
