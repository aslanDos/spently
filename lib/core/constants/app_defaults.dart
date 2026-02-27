import 'package:spently/core/shared/enums/category_type/app_category_type.dart';
import 'package:spently/core/shared/enums/icon_type/app_icon_type.dart';
import 'package:spently/features/account/data/models/account_model.dart';
import 'package:spently/features/category/data/models/category_model.dart';
import 'package:uuid/uuid.dart';

class AppDefaults {
  final Uuid uuid;
  AppDefaults({required this.uuid});

  List<AccountModel> getDefaultAccount() {
    final now = DateTime.now();
    return [
      AccountModel(
        id: uuid.v4(),
        name: 'Card',
        balance: 2500,
        currency: 'KZT',
        icon: AppIconType.piggyBank.value,
        color: '1E88E5',
        isDefault: true,
        order: 0,
        createdAt: now,
        updatedAt: now,
      ),
    ];
  }

  List<CategoryModel> getDefaultCategories() {
    final now = DateTime.now();

    return [
      // Income categories
      CategoryModel(
        id: uuid.v4(),
        name: 'Salary',
        type: CategoryType.income,
        icon: AppIconType.buisnessCase.value,
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
        icon: AppIconType.laptop.value,
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
        icon: AppIconType.gift.value,
        color: 'E91E63',
        isDefault: true,
        createdAt: now,
        updatedAt: now,
        order: 2,
      ),
      CategoryModel(
        id: uuid.v4(),
        name: 'Investements',
        type: CategoryType.income,
        icon: AppIconType.chartCandleStick.value,
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
        icon: AppIconType.fishingHook.value,
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
        icon: AppIconType.car.value,
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
        icon: AppIconType.shoppingBag.value,
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
        icon: AppIconType.cableCar.value,
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
        icon: AppIconType.pill.value,
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
        icon: AppIconType.graduationHat.value,
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
        icon: AppIconType.plane.value,
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
        icon: AppIconType.gift.value,
        color: 'E91E63',
        isDefault: true,
        createdAt: now,
        updatedAt: now,
        order: 7,
      ),
    ];
  }
}
