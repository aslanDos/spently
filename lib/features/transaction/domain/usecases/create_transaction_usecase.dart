import 'package:dartz/dartz.dart';
import 'package:spently/core/errors/failures.dart';
import 'package:spently/core/shared/enums/transaction_type/app_transaction_type.dart';
import 'package:spently/core/usecases/usecase.dart';
import 'package:spently/core/utils/id_generator.dart';
import 'package:spently/features/transaction/domain/entities/transaction_entity.dart';
import 'package:spently/features/transaction/domain/repository/transaction_repository.dart';

class CreateTransactionUseCase
    extends UseCase<TransactionEntity, CreateTransactionParams> {
  final TransactionRepository repository;
  final IdGenerator idGenerator;

  CreateTransactionUseCase(this.repository, this.idGenerator);

  @override
  Future<Either<Failure, TransactionEntity>> call(
    CreateTransactionParams params,
  ) {
    if (params.amount <= 0) {
      return Future.value(
        const Left(ValidationFailure(msg: 'Amount must be greater than zero')),
      );
    }
    if (params.accountId.isEmpty) {
      return Future.value(
        const Left(ValidationFailure(msg: 'Account is required')),
      );
    }
    if (params.categoryId.isEmpty) {
      return Future.value(
        const Left(ValidationFailure(msg: 'Category is required')),
      );
    }

    final now = DateTime.now();

    final transaction = TransactionEntity(
      id: idGenerator.generate(),
      accountId: params.accountId,
      categoryId: params.categoryId,
      amount: params.amount,
      type: params.type,
      date: params.date,
      note: params.note,
      createdAt: now,
      updatedAt: now,
    );

    return repository.createTransaction(transaction);
  }
}

class CreateTransactionParams {
  final String accountId;
  final String categoryId;
  final double amount;
  final TransactionType type;
  final DateTime date;
  final String? note;

  const CreateTransactionParams({
    required this.accountId,
    required this.categoryId,
    required this.amount,
    required this.type,
    required this.date,
    this.note,
  });
}
