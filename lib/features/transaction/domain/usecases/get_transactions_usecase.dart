import 'package:dartz/dartz.dart';
import 'package:spently/core/errors/failures.dart';
import 'package:spently/core/usecases/usecase.dart';
import 'package:spently/features/transaction/domain/entities/transaction_entity.dart';
import 'package:spently/features/transaction/domain/repository/transaction_repository.dart';

class GetTransactionsUseCase
    extends UseCase<List<TransactionEntity>, GetTransactionsParams> {
  final TransactionRepository repository;

  GetTransactionsUseCase(this.repository);

  @override
  Future<Either<Failure, List<TransactionEntity>>> call(
    GetTransactionsParams params,
  ) {
    return repository.getTransactions(filter: params.filter);
  }
}

class GetTransactionsParams {
  final TransactionFilter? filter;

  const GetTransactionsParams({this.filter});
}
