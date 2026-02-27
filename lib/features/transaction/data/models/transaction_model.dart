import 'package:hive/hive.dart';
import 'package:spently/core/shared/enums/transaction_type/app_transaction_type.dart';
import 'package:spently/features/transaction/domain/entities/transaction_entity.dart';

part 'transaction_model.g.dart';

@HiveType(typeId: 3)
class TransactionModel extends TransactionEntity {
  @override
  @HiveField(0)
  final String id;

  @override
  @HiveField(1)
  final String accountId;

  @override
  @HiveField(2)
  final String categoryId;

  @override
  @HiveField(3)
  final double amount;

  @override
  @HiveField(4)
  final TransactionType type;

  @override
  @HiveField(5)
  final DateTime date;

  // HiveField(6) was tags - removed, keeping index unused for data compatibility

  @override
  @HiveField(7)
  final String? note;

  @override
  @HiveField(8)
  final DateTime createdAt;

  @override
  @HiveField(9)
  final DateTime updatedAt;

  const TransactionModel({
    required this.id,
    required this.accountId,
    required this.categoryId,
    required this.amount,
    required this.type,
    required this.date,
    this.note,
    required this.createdAt,
    required this.updatedAt,
  }) : super(
         id: id,
         accountId: accountId,
         categoryId: categoryId,
         amount: amount,
         type: type,
         date: date,
         note: note,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  factory TransactionModel.fromEntity(TransactionEntity entity) {
    return TransactionModel(
      id: entity.id,
      accountId: entity.accountId,
      categoryId: entity.categoryId,
      amount: entity.amount,
      type: entity.type,
      date: entity.date,
      note: entity.note,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  @override
  TransactionModel copyWith({
    String? id,
    String? accountId,
    String? categoryId,
    double? amount,
    TransactionType? type,
    DateTime? date,
    String? note,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      accountId: accountId ?? this.accountId,
      categoryId: categoryId ?? this.categoryId,
      amount: amount ?? this.amount,
      type: type ?? this.type,
      date: date ?? this.date,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
