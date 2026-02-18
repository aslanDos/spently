import 'package:dartz/dartz.dart';
import 'package:spently/core/errors/failures.dart';
import 'package:spently/core/usecases/usecase.dart';
import 'package:spently/features/transaction/domain/entities/transaction_entity.dart';
import 'package:spently/features/transaction/domain/repository/transaction_repository.dart';

class GetTransactionUseCase extends UseCase<TransactionEntity?, String> {
  final TransactionRepository repository;

  GetTransactionUseCase(this.repository);

  @override
  Future<Either<Failure, TransactionEntity?>> call(String transactionId) {
    return repository.getTransaction(transactionId);
  }
}
