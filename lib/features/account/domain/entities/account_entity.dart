import 'package:equatable/equatable.dart';

class AccountEntity extends Equatable {
  final String id;
  final String name;
  final double balance;
  final String currency;
  final String? icon;
  final String? color;
  final bool isDefault;
  final DateTime createdAt;
  final DateTime updatedAt;

  const AccountEntity({
    required this.id,
    required this.name,
    this.balance = 0.0,
    this.currency = 'KZT',
    this.icon,
    this.color,
    this.isDefault = false,
    required this.createdAt,
    required this.updatedAt,
  });

  AccountEntity copyWith({
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
    return AccountEntity(
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

  @override
  List<Object?> get props => [
    id,
    name,
    balance,
    currency,
    icon,
    color,
    isDefault,
    createdAt,
    updatedAt,
  ];
}
