import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spently/features/transaction/domain/entities/transaction_entity.dart';
import 'package:spently/features/transaction/domain/repository/transaction_repository.dart';

part 'transaction_event.freezed.dart';

@freezed
class TransactionEvent with _$TransactionEvent {
  const factory TransactionEvent.loadAll({
    TransactionFilter? filter,
  }) = LoadTransactionsEvent;

  const factory TransactionEvent.load({
    required String transactionId,
  }) = LoadTransactionEvent;

  const factory TransactionEvent.create({
    required TransactionEntity transaction,
  }) = CreateTransactionEvent;

  const factory TransactionEvent.update({
    required TransactionEntity transaction,
  }) = UpdateTransactionEvent;

  const factory TransactionEvent.delete({
    required String transactionId,
  }) = DeleteTransactionEvent;
}
