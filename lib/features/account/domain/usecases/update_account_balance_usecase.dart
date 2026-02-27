import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:spently/core/errors/failures.dart';
import 'package:spently/core/usecases/usecase.dart';
import 'package:spently/features/account/domain/entities/account_entity.dart';
import 'package:spently/features/account/domain/repository/account_repository.dart';

class UpdateAccountBalanceUseCase
    extends UseCase<AccountEntity, UpdateAccountBalanceParams> {
  final AccountRepository repository;

  UpdateAccountBalanceUseCase(this.repository);

  @override
  Future<Either<Failure, AccountEntity>> call(
    UpdateAccountBalanceParams params,
  ) {
    return repository.updateAccountBalance(params.accountId, params.amount);
  }
}

class UpdateAccountBalanceParams extends Equatable {
  final String accountId;
  final double amount;

  const UpdateAccountBalanceParams({
    required this.accountId,
    required this.amount,
  });

  @override
  List<Object?> get props => [accountId, amount];
}
