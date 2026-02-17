import 'package:flutter/material.dart';
import 'package:spently/core/router/router.dart';
import 'package:spently/core/services/hive_service.dart';
import 'package:spently/core/theme/theme.dart';
import 'package:spently/core/di/dependency_injection.dart' as di;
import 'package:spently/features/account/data/models/account_model.dart';
import 'package:spently/features/category/data/models/category_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  // Initialize Hive
  final hiveService = di.sl<HiveService>();
  await hiveService.init();
  hiveService.registerAdapters();

  await hiveService.openBox<AccountModel>(HiveService.accountsBox);
  await hiveService.openBox<CategoryModel>(HiveService.categoriesBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      title: 'Spently',
      routerConfig: AppRouter.router,
    );
  }
}
