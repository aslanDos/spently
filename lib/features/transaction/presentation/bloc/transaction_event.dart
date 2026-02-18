import 'package:equatable/equatable.dart';
import 'package:spently/core/shared/enums/transaction_type/app_transaction_type.dart';
import 'package:spently/features/transaction/domain/entities/transaction_entity.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object?> get props => [];
}

class LoadTransactionsEvent extends TransactionEvent {
  // filter params
  final DateTime? startDate;
  final DateTime? endDate;
  final String? accountId;
  final String? categoryId;
  final TransactionType? type;
  final String? tag;

  const LoadTransactionsEvent({
    this.startDate,
    this.endDate,
    this.accountId,
    this.categoryId,
    this.type,
    this.tag,
  });

  @override
  List<Object?> get props => [
    startDate,
    endDate,
    accountId,
    categoryId,
    type,
    tag,
  ];
}

class LoadTransactionEvent extends TransactionEvent {
  final String transactionId;

  const LoadTransactionEvent({required this.transactionId});

  @override
  List<Object?> get props => [transactionId];
}

class CreateTransactionEvent extends TransactionEvent {
  final String accountId;
  final String categoryId;
  final double amount;
  final TransactionType type;
  final DateTime date;
  final List<String>? tags;
  final String? note;

  const CreateTransactionEvent({
    required this.accountId,
    required this.categoryId,
    required this.amount,
    required this.type,
    required this.date,
    this.tags,
    this.note,
  });

  @override
  List<Object?> get props => [
    accountId,
    categoryId,
    amount,
    type,
    date,
    tags,
    note,
  ];
}

class UpdateTransactionEvent extends TransactionEvent {
  final TransactionEntity transaction;
  final String accountId;
  final String categoryId;
  final double amount;
  final TransactionType type;
  final DateTime date;
  final List<String>? tags;
  final String? note;

  const UpdateTransactionEvent({
    required this.transaction,
    required this.accountId,
    required this.categoryId,
    required this.amount,
    required this.type,
    required this.date,
    this.tags,
    this.note,
  });

  @override
  List<Object?> get props => [
    transaction,
    accountId,
    categoryId,
    amount,
    type,
    date,
    tags,
    note,
  ];
}

class DeleteTransactionEvent extends TransactionEvent {
  final String transactionId;

  const DeleteTransactionEvent({required this.transactionId});

  @override
  List<Object?> get props => [transactionId];
}
