import 'package:dartz/dartz.dart';
import 'package:spently/core/errors/failures.dart';
import 'package:spently/core/usecases/usecase.dart';
import 'package:spently/features/transaction/domain/entities/transaction_entity.dart';
import 'package:spently/features/transaction/domain/repository/transaction_repository.dart';

class UpdateTransactionUseCase
    extends UseCase<TransactionEntity, TransactionEntity> {
  final TransactionRepository repository;

  UpdateTransactionUseCase(this.repository);

  @override
  Future<Either<Failure, TransactionEntity>> call(
    TransactionEntity transaction,
  ) {
    if (transaction.amount <= 0) {
      return Future.value(
        const Left(ValidationFailure(msg: 'Amount must be greater than zero')),
      );
    }
    if (transaction.accountId.isEmpty) {
      return Future.value(
        const Left(ValidationFailure(msg: 'Account is required')),
      );
    }
    if (transaction.categoryId.isEmpty) {
      return Future.value(
        const Left(ValidationFailure(msg: 'Category is required')),
      );
    }

    final updatedTransaction = transaction.copyWith(
      updatedAt: DateTime.now(),
    );

    return repository.updateTransaction(updatedTransaction);
  }
}
