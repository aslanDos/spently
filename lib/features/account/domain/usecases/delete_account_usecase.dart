import 'package:dartz/dartz.dart';
import 'package:spently/core/errors/failures.dart';
import 'package:spently/core/usecases/usecase.dart';
import 'package:spently/features/account/domain/repository/account_repository.dart';

class DeleteAccountUseCase extends UseCase<void, String> {
  final AccountRepository repository;

  DeleteAccountUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(String accountId) {
    return repository.deleteAccount(accountId);
  }
}
