import 'package:hive_flutter/hive_flutter.dart';
import 'package:spently/core/shared/enums/category_type/app_category_type.dart';
import 'package:spently/features/account/data/models/account_model.dart';
import 'package:spently/features/category/data/models/category_model.dart';

class HiveService {
  static final String accountsBox = 'accounts';
  static const String categoriesBox = 'categories';

  Future<void> init() async {
    await Hive.initFlutter();
  }

  void registerAdapters() {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter<AccountModel>(AccountModelAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter<CategoryModel>(CategoryModelAdapter());
    }
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter<CategoryType>(CategoryTypeAdapter());
    }
  }

  Future<Box<T>> openBox<T>(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box<T>(boxName);
    }
    return Hive.openBox<T>(boxName);
  }

  Future<void> closeAllBoxes() async {
    await Hive.close();
  }

  Future<void> clearBox(String boxName) async {
    final box = await openBox(boxName);
    await box.clear();
  }

  Future<void> clearAllBoxes() async {
    await clearBox(accountsBox);
  }
}
