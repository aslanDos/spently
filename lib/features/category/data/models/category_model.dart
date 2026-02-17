import 'package:hive/hive.dart';
import 'package:spently/core/shared/enums/category_type/app_category_type.dart';
import 'package:spently/features/category/domain/entities/category_entity.dart';

part 'category_model.g.dart';

@HiveType(typeId: 1)
class CategoryModel extends CategoryEntity {
  @override
  @HiveField(0)
  final String id;

  @override
  @HiveField(1)
  final String name;

  @override
  @HiveField(2)
  final CategoryType type;

  @override
  @HiveField(3)
  final String icon;

  @override
  @HiveField(4)
  final String color;

  @override
  @HiveField(5)
  final bool isDefault;

  @override
  @HiveField(6)
  final DateTime createdAt;

  @override
  @HiveField(7)
  final DateTime updatedAt;

  @override
  @HiveField(8)
  final int order;

  @override
  @HiveField(9)
  final bool isVisible;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.type,
    required this.icon,
    required this.color,
    this.isDefault = false,
    required this.createdAt,
    required this.updatedAt,
    this.order = 0,
    this.isVisible = true,
  }) : super(
         id: id,
         name: name,
         type: type,
         icon: icon,
         color: color,
         isDefault: isDefault,
         createdAt: createdAt,
         updatedAt: updatedAt,
         order: order,
         isVisible: isVisible,
       );

  factory CategoryModel.fromEntity(CategoryEntity entity) {
    return CategoryModel(
      id: entity.id,
      name: entity.name,
      type: entity.type,
      icon: entity.icon,
      color: entity.color,
      isDefault: entity.isDefault,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      order: entity.order,
      isVisible: entity.isVisible,
    );
  }

  @override
  CategoryModel copyWith({
    String? id,
    String? name,
    CategoryType? type,
    String? icon,
    String? color,
    bool? isDefault,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? order,
    bool? isVisible,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      isDefault: isDefault ?? this.isDefault,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      order: order ?? this.order,
      isVisible: isVisible ?? this.isVisible,
    );
  }
}
