import 'package:spently/core/errors/failures.dart';
import 'package:spently/features/account/domain/entities/account_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AccountRepository {
  Future<Either<Failure, List<AccountEntity>>> getAccounts();

  Future<Either<Failure, AccountEntity?>> getAccount(String accountId);

  Future<Either<Failure, AccountEntity>> createAccount(AccountEntity account);

  Future<Either<Failure, AccountEntity>> updateAccount(AccountEntity account);

  Future<Either<Failure, void>> deleteAccount(String accountId);

  Future<Either<Failure, AccountEntity>> updateAccountBalance(
    String accountId,
    double amount,
  );

  Future<Either<Failure, void>> seedDefaultAccount();
}
