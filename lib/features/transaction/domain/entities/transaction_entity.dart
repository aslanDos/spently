import 'package:equatable/equatable.dart';
import 'package:spently/core/shared/enums/transaction_type/app_transaction_type.dart';

class TransactionEntity extends Equatable {
  final String id;
  final String accountId;
  final String categoryId;
  final double amount;
  final TransactionType type;
  final DateTime date;
  final List<String> tags;
  final String? note;
  final DateTime createdAt;
  final DateTime updatedAt;

  const TransactionEntity({
    required this.id,
    required this.accountId,
    required this.categoryId,
    required this.amount,
    required this.type,
    required this.date,
    this.note,
    this.tags = const [],
    required this.createdAt,
    required this.updatedAt,
  });

  TransactionEntity copyWith({
    String? id,
    String? accountId,
    String? categoryId,
    double? amount,
    TransactionType? type,
    DateTime? date,
    List<String>? tags,
    String? note,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TransactionEntity(
      id: id ?? this.id,
      accountId: accountId ?? this.accountId,
      categoryId: categoryId ?? this.categoryId,
      amount: amount ?? this.amount,
      type: type ?? this.type,
      date: date ?? this.date,
      tags: tags ?? this.tags,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
    id,
    accountId,
    categoryId,
    amount,
    type,
    date,
    note,
    tags,
    createdAt,
    updatedAt,
  ];
}
