import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:spently/core/shared/enums/icon_type/app_icon_type.dart';
import 'package:spently/core/shared/mappers/app_color_mappers.dart';

class AccountEntity extends Equatable {
  final String id;
  final String name;
  final double balance;
  final String currency;
  final String? icon;
  final String? color;
  final bool isDefault;
  final int order;
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
    this.order = 0,
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
    int? order,
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
      order: order ?? this.order,
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
    order,
    createdAt,
    updatedAt,
  ];
}

extension AccountIconX on AccountEntity {
  AppIconType get iconType =>
      icon != null ? AppIconType.fromString(icon!) : AppIconType.wallet;
}

extension AccountColorX on AccountEntity {
  Color get backgroundColor => color != null ? color!.toColor() : Colors.grey;
}
