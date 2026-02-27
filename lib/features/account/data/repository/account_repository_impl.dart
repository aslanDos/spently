import 'package:dartz/dartz.dart';
import 'package:spently/core/constants/app_defaults.dart';
import 'package:uuid/uuid.dart';
import 'package:spently/core/errors/failures.dart';
import 'package:spently/features/account/data/data_source/account_local_data_source.dart';
import 'package:spently/features/account/data/models/account_model.dart';
import 'package:spently/features/account/domain/entities/account_entity.dart';
import 'package:spently/features/account/domain/repository/account_repository.dart';

class AccountRepositoryImpl implements AccountRepository {
  final AccountLocalDataSource _localDataSource;
  final Uuid _uuid;
  AccountRepositoryImpl({
    required AccountLocalDataSource localDataSource,
    Uuid? uuid,
  }) : _localDataSource = localDataSource,
       _uuid = uuid ?? const Uuid();

  @override
  Future<Either<Failure, List<AccountEntity>>> getAccounts() async {
    try {
      final accounts = await _localDataSource.getAccounts();
      return Right(accounts.cast<AccountEntity>());
    } catch (e) {
      return Left(CacheFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AccountEntity?>> getAccount(String accountId) async {
    try {
      final account = await _localDataSource.getAccount(accountId);
      return Right(account);
    } catch (e) {
      return Left(CacheFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AccountEntity>> createAccount(
    AccountEntity account,
  ) async {
    try {
      final existingAccounts = await _localDataSource.getAccounts();
      final maxOrder = existingAccounts.isEmpty
          ? -1
          : existingAccounts.map((a) => a.order).reduce((a, b) => a > b ? a : b);

      final accountWithIdAndOrder = account.copyWith(
        id: account.id.isEmpty ? _uuid.v4() : account.id,
        order: maxOrder + 1,
      );
      final model = AccountModel.fromEntity(accountWithIdAndOrder);
      await _localDataSource.saveAccount(model);
      return Right(model);
    } catch (e) {
      return Left(CacheFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AccountEntity>> updateAccount(
    AccountEntity account,
  ) async {
    try {
      final model = AccountModel.fromEntity(account);
      await _localDataSource.saveAccount(model);
      return Right(model);
    } catch (e) {
      return Left(CacheFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAccount(String accountId) async {
    try {
      await _localDataSource.deleteAccount(accountId);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AccountEntity>> updateAccountBalance(
    String accountId,
    double amount,
  ) async {
    try {
      final existing = await _localDataSource.getAccount(accountId);

      if (existing == null) {
        return Left(CacheFailure(msg: 'Account not found'));
      }

      final updated = existing.copyWith(
        balance: existing.balance + amount,
        updatedAt: DateTime.now(),
      );

      await _localDataSource.saveAccount(updated);

      return Right(updated);
    } catch (e) {
      return Left(CacheFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> seedDefaultAccount() async {
    try {
      final existingAccounts = await _localDataSource.getAccounts();

      if (existingAccounts.isNotEmpty) {
        return const Right(null);
      }

      final defaultAccount = AppDefaults(uuid: _uuid).getDefaultAccount();

      await _localDataSource.saveAccounts(defaultAccount);

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(msg: e.toString()));
    }
  }
}
