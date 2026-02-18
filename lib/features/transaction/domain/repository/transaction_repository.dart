import 'package:dartz/dartz.dart';
import 'package:spently/core/errors/failures.dart';
import 'package:spently/core/shared/enums/transaction_type/app_transaction_type.dart';
import 'package:spently/features/transaction/domain/entities/transaction_entity.dart';

abstract class TransactionRepository {
  Future<Either<Failure, List<TransactionEntity>>> getTransactions({
    TransactionFilter? filter,
  });
  Future<Either<Failure, TransactionEntity?>> getTransaction(
    String transactionId,
  );
  Future<Either<Failure, TransactionEntity>> createTransaction(
    TransactionEntity transaction,
  );
  Future<Either<Failure, TransactionEntity>> updateTransaction(
    TransactionEntity transaction,
  );
  Future<Either<Failure, void>> deleteTransaction(String transactionId);
}

class TransactionFilter {
  final DateTime? startDate;
  final DateTime? endDate;
  final String? accountId;
  final String? categoryId;
  final TransactionType? type;
  final String? tag;

  const TransactionFilter({
    this.startDate,
    this.endDate,
    this.accountId,
    this.categoryId,
    this.type,
    this.tag,
  });
}
