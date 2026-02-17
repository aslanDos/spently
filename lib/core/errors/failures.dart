import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String msg;
  const Failure({this.msg = ''});

  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  const ServerFailure({super.msg = 'Server failure'});
}

class CashFailure extends Failure {
  const CashFailure({super.msg = 'Cash failure'});
}

class NetworkFailure extends Failure {
  const NetworkFailure({super.msg = 'Network failure'});
}

class AuthenticationFailure extends Failure {
  const AuthenticationFailure({super.msg = 'Auth failure'});
}

class ValidationFailure extends Failure {
  const ValidationFailure({super.msg = 'Validation failure'});
}

class ConnectionFailure extends Failure {
  const ConnectionFailure({super.msg = 'Connection failure'});
}

class CacheFailure extends Failure {
  const CacheFailure({super.msg = 'Cache failure'});
}

class SyncFailure extends Failure {
  const SyncFailure({super.msg = 'Sync failure'});
}
