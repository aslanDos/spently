import 'package:dartz/dartz.dart';
import 'package:spently/core/errors/failures.dart';
import 'package:spently/core/usecases/usecase.dart';
import 'package:spently/features/account/domain/repository/account_repository.dart';

class SeedDefaultAccountUseCase extends UseCase<void, NoParams> {
  final AccountRepository repository;

  SeedDefaultAccountUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return repository.seedDefaultAccount();
  }
}
