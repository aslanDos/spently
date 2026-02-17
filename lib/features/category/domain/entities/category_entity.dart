// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:spently/core/shared/enums/category_type/app_category_type.dart';

class CategoryEntity extends Equatable {
  final String id;
  final String name;
  final CategoryType type;
  final String icon;
  final String color;
  final bool isDefault;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int order;
  final bool isVisible;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.icon,
    required this.color,
    this.isDefault = false,
    required this.createdAt,
    required this.updatedAt,
    required this.order,
    this.isVisible = true,
  });

  CategoryEntity copyWith({
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
    return CategoryEntity(
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

  @override
  List<Object?> get props => [
    id,
    name,
    type,
    icon,
    color,
    isDefault,
    createdAt,
    updatedAt,
    order,
    isVisible,
  ];
}
