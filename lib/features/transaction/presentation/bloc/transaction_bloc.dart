import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spently/features/transaction/domain/repository/transaction_repository.dart';
import 'package:spently/features/transaction/presentation/bloc/transaction_event.dart';
import 'package:spently/features/transaction/presentation/bloc/transaction_state.dart';

import '../../domain/usecases/transaction_usecases.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final GetTransactionsUseCase _getTransactions;
  final GetTransactionUseCase _getTransaction;
  final CreateTransactionUseCase _createTransaction;
  final UpdateTransactionUseCase _updateTransaction;
  final DeleteTransactionUseCase _deleteTransaction;

  TransactionBloc({
    required GetTransactionsUseCase getTransactions,
    required GetTransactionUseCase getTransaction,
    required CreateTransactionUseCase createTransaction,
    required UpdateTransactionUseCase updateTransaction,
    required DeleteTransactionUseCase deleteTransaction,
  }) : _getTransactions = getTransactions,
       _getTransaction = getTransaction,
       _createTransaction = createTransaction,
       _updateTransaction = updateTransaction,
       _deleteTransaction = deleteTransaction,
       super(TransactionInitial()) {
    on<LoadTransactionsEvent>(_onLoadTransactions);
    on<LoadTransactionEvent>(_onLoadTransaction);
    on<CreateTransactionEvent>(_onCreateTransaction);
    on<UpdateTransactionEvent>(_onUpdateTransaction);
    on<DeleteTransactionEvent>(_onDeleteTransaction);
  }

  Future<void> _onLoadTransactions(
    LoadTransactionsEvent event,
    Emitter<TransactionState> emit,
  ) async {
    emit(TransactionLoading());

    final result = await _getTransactions(
      GetTransactionsParams(
        filter: TransactionFilter(
          startDate: event.startDate,
          endDate: event.endDate,
          accountId: event.accountId,
          categoryId: event.categoryId,
          type: event.type,
          tag: event.tag,
        ),
      ),
    );

    result.fold(
      (failure) => emit(TransactionError(failure.msg)),
      (transactions) => emit(TransactionsLoaded(transactions)),
    );
  }

  Future<void> _onLoadTransaction(
    LoadTransactionEvent event,
    Emitter<TransactionState> emit,
  ) async {
    emit(TransactionLoading());
    final result = await _getTransaction(event.transactionId);
    result.fold((failure) => emit(TransactionError(failure.msg)), (
      transaction,
    ) {
      if (transaction != null) {
        emit(TransactionLoaded(transaction));
      } else {
        emit(const TransactionError('Transaction not found'));
      }
    });
  }

  Future<void> _onCreateTransaction(
    CreateTransactionEvent event,
    Emitter<TransactionState> emit,
  ) async {
    emit(TransactionLoading());

    final result = await _createTransaction(
      CreateTransactionParams(
        accountId: event.accountId,
        categoryId: event.categoryId,
        amount: event.amount,
        type: event.type,
        date: event.date,
      ),
    );

    result.fold(
      (failure) => emit(TransactionError(failure.msg)),
      (transaction) => emit(TransactionCreated(transaction)),
    );
  }

  Future<void> _onUpdateTransaction(
    UpdateTransactionEvent event,
    Emitter<TransactionState> emit,
  ) async {
    emit(TransactionLoading());

    final result = await _updateTransaction(
      UpdateTransactionParams(
        transaction: event.transaction,
        accountId: event.accountId,
        categoryId: event.categoryId,
        amount: event.amount,
        type: event.type,
        note: event.note,
        tags: event.tags!,
        date: event.date,
      ),
    );

    result.fold(
      (failure) => emit(TransactionError(failure.msg)),
      (transaction) => emit(TransactionUpdated(transaction)),
    );
  }

  Future<void> _onDeleteTransaction(
    DeleteTransactionEvent event,
    Emitter<TransactionState> emit,
  ) async {
    emit(TransactionLoading());

    final result = await _deleteTransaction(event.transactionId);

    result.fold(
      (failure) => emit(TransactionError(failure.msg)),
      (_) => emit(TransactionDeleted(event.transactionId)),
    );
  }
}
