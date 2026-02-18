import 'package:dartz/dartz.dart';
import 'package:spently/core/errors/failures.dart';
import 'package:spently/core/usecases/usecase.dart';
import 'package:spently/features/transaction/domain/repository/transaction_repository.dart';

class DeleteTransactionUseCase extends UseCase<void, String> {
  final TransactionRepository repository;

  DeleteTransactionUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(String transactionId) {
    return repository.deleteTransaction(transactionId);
  }
}
