import 'package:dartz/dartz.dart';
import 'package:spently/core/errors/failures.dart';
import 'package:spently/core/usecases/usecase.dart';
import 'package:spently/features/account/domain/entities/account_entity.dart';
import 'package:spently/features/account/domain/repository/account_repository.dart';

class CreateAccountUseCase extends UseCase<AccountEntity, AccountEntity> {
  final AccountRepository repository;

  CreateAccountUseCase(this.repository);

  @override
  Future<Either<Failure, AccountEntity>> call(AccountEntity account) {
    if (account.name.trim().isEmpty) {
      return Future.value(
        const Left(ValidationFailure(msg: 'Account name cannot be empty')),
      );
    }
    return repository.createAccount(account);
  }
}
