import 'package:dartz/dartz.dart';
import 'package:spently/core/errors/failures.dart';
import 'package:spently/core/shared/enums/transaction_type/app_transaction_type.dart';
import 'package:spently/features/account/domain/repository/account_repostiory.dart';
import 'package:spently/features/transaction/data/data_source/transaction_local_data_source.dart';
import 'package:spently/features/transaction/data/models/transaction_model.dart';
import 'package:spently/features/transaction/domain/entities/transaction_entity.dart';
import 'package:spently/features/transaction/domain/repository/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionLocalDataSource _localDataSource;
  final AccountRepository _accountRepository;

  TransactionRepositoryImpl({
    required TransactionLocalDataSource localDataSource,
    required AccountRepository accountRepository,
  }) : _localDataSource = localDataSource,
       _accountRepository = accountRepository;

  @override
  Future<Either<Failure, TransactionEntity>> createTransaction(
    TransactionEntity transaction,
  ) async {
    try {
      final model = TransactionModel.fromEntity(transaction);

      final balanceChange = transaction.type == TransactionType.income
          ? transaction.amount
          : -transaction.amount;

      await _accountRepository.updateAccountBalance(
        transaction.accountId,
        balanceChange,
      );

      await _localDataSource.saveTransaction(model);

      return Right(model);
    } catch (e) {
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTransaction(String transactionId) async {
    try {
      // Get existing transaction to revert balance
      final existingResult = await getTransaction(transactionId);
      return existingResult.fold((failure) => Left(failure), (existing) async {
        if (existing != null) {
          // Revert balance change
          final balanceChange = existing.type == TransactionType.income
              ? -existing.amount
              : existing.amount;
          await _accountRepository.updateAccountBalance(
            existing.accountId,
            balanceChange,
          );
        }

        await _localDataSource.deleteTransaction(transactionId);

        return const Right(null);
      });
    } catch (e) {
      return Left(CacheFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TransactionEntity?>> getTransaction(
    String transactionId,
  ) async {
    try {
      final transaction = await _localDataSource.getTransaction(transactionId);

      return Right(transaction);
    } catch (e) {
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TransactionEntity>>> getTransactions({
    TransactionFilter? filter,
  }) async {
    try {
      final transactions = await _localDataSource.getTransactions(
        filter: filter,
      );
      return Right(transactions);
    } catch (e) {
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TransactionEntity>> updateTransaction(
    TransactionEntity transaction,
  ) async {
    try {
      // Get existing transaction to calculate balance difference
      final existingResult = await getTransaction(transaction.id);

      return existingResult.fold((failure) => Left(failure), (existing) async {
        if (existing == null) {
          return const Left(ServerFailure(msg: 'Transaction not found'));
        }

        final model = TransactionModel.fromEntity(transaction);

        await _localDataSource.saveTransaction(model);

        // Revert old balance change
        final oldBalanceChange = existing.type == TransactionType.income
            ? -existing.amount
            : existing.amount;
        await _accountRepository.updateAccountBalance(
          existing.accountId,
          oldBalanceChange,
        );

        // Apply new balance change
        final newBalanceChange = transaction.type == TransactionType.income
            ? transaction.amount
            : -transaction.amount;
        await _accountRepository.updateAccountBalance(
          transaction.accountId,
          newBalanceChange,
        );

        return Right(model);
      });
    } catch (e) {
      return Left(CashFailure(msg: e.toString()));
    }
  }
}
