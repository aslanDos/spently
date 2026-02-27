import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spently/core/shared/enums/transaction_type/app_transaction_type.dart';
import 'package:spently/features/transaction/domain/entities/transaction_entity.dart';

part 'transaction_state.freezed.dart';

enum TransactionOperation { create, update, delete }

@freezed
class TransactionState with _$TransactionState {
  const TransactionState._();

  const factory TransactionState.initial() = TransactionInitial;

  const factory TransactionState.loading({
    @Default([]) List<TransactionEntity> transactions,
  }) = TransactionLoading;

  const factory TransactionState.loaded({
    required List<TransactionEntity> transactions,
  }) = TransactionsLoaded;

  const factory TransactionState.success({
    required TransactionOperation operation,
    required List<TransactionEntity> transactions,
  }) = TransactionSuccess;

  const factory TransactionState.failure({
    required String message,
    @Default([]) List<TransactionEntity> transactions,
  }) = TransactionFailure;

  // Computed properties available on all states
  List<TransactionEntity> get transactions => map(
    initial: (_) => [],
    loading: (s) => s.transactions,
    loaded: (s) => s.transactions,
    success: (s) => s.transactions,
    failure: (s) => s.transactions,
  );

  double get totalIncome => transactions
      .where((t) => t.type == TransactionType.income)
      .fold(0.0, (sum, t) => sum + t.amount);

  double get totalExpense => transactions
      .where((t) => t.type == TransactionType.expense)
      .fold(0.0, (sum, t) => sum + t.amount);

  double get balance => totalIncome - totalExpense;

  List<TransactionEntity> get recentTransactions =>
      transactions.take(10).toList();

  bool get isLoading => this is TransactionLoading;
  bool get isLoaded => this is TransactionsLoaded || this is TransactionSuccess;
  bool get hasError => this is TransactionFailure;
}
