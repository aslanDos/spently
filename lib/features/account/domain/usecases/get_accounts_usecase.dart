import 'package:dartz/dartz.dart';
import 'package:spently/core/errors/failures.dart';
import 'package:spently/core/usecases/usecase.dart';
import 'package:spently/features/account/domain/entities/account_entity.dart';
import 'package:spently/features/account/domain/repository/account_repository.dart';

class GetAccountsUseCase extends UseCase<List<AccountEntity>, NoParams> {
  final AccountRepository repository;

  GetAccountsUseCase(this.repository);

  @override
  Future<Either<Failure, List<AccountEntity>>> call(NoParams params) {
    return repository.getAccounts();
  }
}
