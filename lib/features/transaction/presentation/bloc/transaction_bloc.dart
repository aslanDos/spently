import 'package:flutter_bloc/flutter_bloc.dart';
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
       super(const TransactionState.initial()) {
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
    emit(TransactionState.loading(transactions: state.transactions));

    final result = await _getTransactions(
      GetTransactionsParams(filter: event.filter),
    );

    result.fold(
      (failure) => emit(TransactionState.failure(
        message: failure.msg,
        transactions: state.transactions,
      )),
      (transactions) => emit(TransactionState.loaded(transactions: transactions)),
    );
  }

  Future<void> _onLoadTransaction(
    LoadTransactionEvent event,
    Emitter<TransactionState> emit,
  ) async {
    emit(TransactionState.loading(transactions: state.transactions));

    final result = await _getTransaction(event.transactionId);

    result.fold(
      (failure) => emit(TransactionState.failure(
        message: failure.msg,
        transactions: state.transactions,
      )),
      (transaction) {
        if (transaction != null) {
          // Optionally update the transaction in the list
          emit(TransactionState.loaded(transactions: state.transactions));
        } else {
          emit(TransactionState.failure(
            message: 'Transaction not found',
            transactions: state.transactions,
          ));
        }
      },
    );
  }

  Future<void> _onCreateTransaction(
    CreateTransactionEvent event,
    Emitter<TransactionState> emit,
  ) async {
    emit(TransactionState.loading(transactions: state.transactions));

    final result = await _createTransaction(
      CreateTransactionParams(
        accountId: event.transaction.accountId,
        categoryId: event.transaction.categoryId,
        amount: event.transaction.amount,
        type: event.transaction.type,
        date: event.transaction.date,
        note: event.transaction.note,
      ),
    );

    await result.fold(
      (failure) async => emit(TransactionState.failure(
        message: failure.msg,
        transactions: state.transactions,
      )),
      (transaction) async {
        await _refreshAndEmitSuccess(emit, TransactionOperation.create);
      },
    );
  }

  Future<void> _onUpdateTransaction(
    UpdateTransactionEvent event,
    Emitter<TransactionState> emit,
  ) async {
    emit(TransactionState.loading(transactions: state.transactions));

    final result = await _updateTransaction(event.transaction);

    await result.fold(
      (failure) async => emit(TransactionState.failure(
        message: failure.msg,
        transactions: state.transactions,
      )),
      (transaction) async {
        await _refreshAndEmitSuccess(emit, TransactionOperation.update);
      },
    );
  }

  Future<void> _onDeleteTransaction(
    DeleteTransactionEvent event,
    Emitter<TransactionState> emit,
  ) async {
    emit(TransactionState.loading(transactions: state.transactions));

    final result = await _deleteTransaction(event.transactionId);

    await result.fold(
      (failure) async => emit(TransactionState.failure(
        message: failure.msg,
        transactions: state.transactions,
      )),
      (_) async {
        await _refreshAndEmitSuccess(emit, TransactionOperation.delete);
      },
    );
  }

  Future<void> _refreshAndEmitSuccess(
    Emitter<TransactionState> emit,
    TransactionOperation operation,
  ) async {
    final result = await _getTransactions(const GetTransactionsParams());
    result.fold(
      (failure) => emit(TransactionState.failure(
        message: failure.msg,
        transactions: state.transactions,
      )),
      (transactions) => emit(TransactionState.success(
        operation: operation,
        transactions: transactions,
      )),
    );
  }
}
