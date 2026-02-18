import 'package:dartz/dartz.dart';
import 'package:spently/core/errors/failures.dart';
import 'package:spently/core/shared/enums/transaction_type/app_transaction_type.dart';
import 'package:spently/core/usecases/usecase.dart';
import 'package:spently/features/transaction/domain/entities/transaction_entity.dart';
import 'package:spently/features/transaction/domain/repository/transaction_repository.dart';

class UpdateTransactionUseCase
    extends UseCase<TransactionEntity, UpdateTransactionParams> {
  final TransactionRepository repository;

  UpdateTransactionUseCase(this.repository);

  @override
  Future<Either<Failure, TransactionEntity>> call(
    UpdateTransactionParams params,
  ) {
    if (params.amount <= 0) {
      return Future.value(
        const Left(ValidationFailure(msg: 'Amount must be greater than zero')),
      );
    }

    final updatedTransaction = params.transaction.copyWith(
      accountId: params.accountId,
      categoryId: params.categoryId,
      amount: params.amount,
      type: params.type,
      date: params.date,
      note: params.note,
      tags: params.tags,
      updatedAt: DateTime.now(),
    );

    return repository.updateTransaction(updatedTransaction);
  }
}

class UpdateTransactionParams {
  final TransactionEntity transaction;
  final String accountId;
  final String categoryId;
  final double amount;
  final TransactionType type;
  final DateTime date;
  final String? note;
  final List<String> tags;

  const UpdateTransactionParams({
    required this.transaction,
    required this.accountId,
    required this.categoryId,
    required this.amount,
    required this.type,
    required this.date,
    this.note,
    this.tags = const [],
  });
}
