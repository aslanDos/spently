import 'package:spently/core/shared/enums/category_type/app_category_type.dart';
import 'package:spently/features/category/data/models/category_model.dart';
import 'package:uuid/uuid.dart';

class AppDefaults {
  final Uuid uuid;
  AppDefaults({required this.uuid});

  List<CategoryModel> getDefaultCategories() {
    final now = DateTime.now();

    return [
      // Income categories
      CategoryModel(
        id: uuid.v4(),
        name: 'Salary',
        type: CategoryType.income,
        icon: 'work',
        color: '4CAF50',
        isDefault: true,
        createdAt: now,
        updatedAt: now,
        order: 0,
      ),
      CategoryModel(
        id: uuid.v4(),
        name: 'Freelance',
        type: CategoryType.income,
        icon: 'computer',
        color: '2196F3',
        isDefault: true,
        createdAt: now,
        updatedAt: now,
        order: 1,
      ),
      CategoryModel(
        id: uuid.v4(),
        name: 'Gifts',
        type: CategoryType.income,
        icon: 'card_giftcard',
        color: 'E91E63',
        isDefault: true,
        createdAt: now,
        updatedAt: now,
        order: 2,
      ),
      CategoryModel(
        id: uuid.v4(),
        name: 'Investments',
        type: CategoryType.income,
        icon: 'trending_up',
        color: '9C27B0',
        isDefault: true,
        createdAt: now,
        updatedAt: now,
        order: 3,
      ),
      // Expense categories
      CategoryModel(
        id: uuid.v4(),
        name: 'Food',
        type: CategoryType.expense,
        icon: 'restaurant',
        color: 'FF9800',
        isDefault: true,
        createdAt: now,
        updatedAt: now,
        order: 0,
      ),
      CategoryModel(
        id: uuid.v4(),
        name: 'Transport',
        type: CategoryType.expense,
        icon: 'directions_car',
        color: '607D8B',
        isDefault: true,
        createdAt: now,
        updatedAt: now,
        order: 1,
      ),
      CategoryModel(
        id: uuid.v4(),
        name: 'Shopping',
        type: CategoryType.expense,
        icon: 'shopping_bag',
        color: 'F44336',
        isDefault: true,
        createdAt: now,
        updatedAt: now,
        order: 2,
      ),
      CategoryModel(
        id: uuid.v4(),
        name: 'Entertainment',
        type: CategoryType.expense,
        icon: 'movie',
        color: '673AB7',
        isDefault: true,
        createdAt: now,
        updatedAt: now,
        order: 3,
      ),
      CategoryModel(
        id: uuid.v4(),
        name: 'Health',
        type: CategoryType.expense,
        icon: 'local_hospital',
        color: '00BCD4',
        isDefault: true,
        createdAt: now,
        updatedAt: now,
        order: 4,
      ),
      CategoryModel(
        id: uuid.v4(),
        name: 'Education',
        type: CategoryType.expense,
        icon: 'school',
        color: '3F51B5',
        isDefault: true,
        createdAt: now,
        updatedAt: now,
        order: 5,
      ),
      CategoryModel(
        id: uuid.v4(),
        name: 'Travel',
        type: CategoryType.expense,
        icon: 'flight',
        color: '009688',
        isDefault: true,
        createdAt: now,
        updatedAt: now,
        order: 6,
      ),
      CategoryModel(
        id: uuid.v4(),
        name: 'Gifts',
        type: CategoryType.expense,
        icon: 'card_giftcard',
        color: 'E91E63',
        isDefault: true,
        createdAt: now,
        updatedAt: now,
        order: 7,
      ),
    ];
  }
}
