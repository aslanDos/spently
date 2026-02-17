import 'package:dartz/dartz.dart';
import 'package:spently/core/errors/failures.dart';
import 'package:spently/core/usecases/usecase.dart';
import 'package:spently/features/account/domain/entities/account_entity.dart';
import 'package:spently/features/account/domain/repository/account_repostiory.dart';

class GetAccountUseCase extends UseCase<AccountEntity?, String> {
  final AccountRepository repository;

  GetAccountUseCase(this.repository);

  @override
  Future<Either<Failure, AccountEntity?>> call(String accountId) {
    return repository.getAccount(accountId);
  }
}
