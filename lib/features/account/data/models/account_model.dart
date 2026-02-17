import 'package:hive_flutter/hive_flutter.dart';
import 'package:spently/features/account/domain/entities/account_entity.dart';

part 'account_model.g.dart';

@HiveType(typeId: 0)
class AccountModel extends AccountEntity {
  @override
  @HiveField(0)
  final String id;

  @override
  @HiveField(1)
  final String name;

  @override
  @HiveField(3)
  final double balance;

  @override
  @HiveField(4)
  final String currency;

  @override
  @HiveField(5)
  final String? icon;

  @override
  @HiveField(6)
  final String? color;

  @override
  @HiveField(7)
  final bool isDefault;

  @override
  @HiveField(8)
  final DateTime createdAt;

  @override
  @HiveField(9)
  final DateTime updatedAt;

  const AccountModel({
    required this.id,
    required this.name,
    this.balance = 0.0,
    this.currency = 'USD',
    this.icon,
    this.color,
    this.isDefault = false,
    required this.createdAt,
    required this.updatedAt,
  }) : super(
         id: id,
         name: name,
         balance: balance,
         currency: currency,
         icon: icon,
         color: color,
         isDefault: isDefault,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  factory AccountModel.fromEntity(AccountEntity entity) {
    return AccountModel(
      id: entity.id,
      name: entity.name,
      balance: entity.balance,
      currency: entity.currency,
      icon: entity.icon,
      color: entity.color,
      isDefault: entity.isDefault,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  @override
  AccountModel copyWith({
    String? id,
    String? name,
    double? balance,
    String? currency,
    String? icon,
    String? color,
    bool? isDefault,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return AccountModel(
      id: id ?? this.id,
      name: name ?? this.name,
      balance: balance ?? this.balance,
      currency: currency ?? this.currency,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      isDefault: isDefault ?? this.isDefault,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
