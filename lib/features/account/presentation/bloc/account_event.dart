import 'package:equatable/equatable.dart';
import 'package:spently/features/account/domain/entities/account_entity.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object?> get props => [];
}

class LoadAccountEvent extends AccountEvent {
  final String accountId;

  const LoadAccountEvent({required this.accountId});

  @override
  List<Object?> get props => [accountId];
}

class LoadAccountsEvent extends AccountEvent {
  const LoadAccountsEvent();

  @override
  List<Object?> get props => [];
}

class CreateAccountEvent extends AccountEvent {
  final AccountEntity account;

  const CreateAccountEvent({required this.account});

  @override
  List<Object?> get props => [account];
}

class UpdateAccountEvent extends AccountEvent {
  final AccountEntity account;

  const UpdateAccountEvent({required this.account});

  @override
  List<Object?> get props => [account];
}

class DeleteAccountEvent extends AccountEvent {
  final String accountId;

  const DeleteAccountEvent({required this.accountId});

  @override
  List<Object?> get props => [accountId];
}

class UpdateAccountBalanceEvent extends AccountEvent {
  final String accountId;
  final double amount;

  const UpdateAccountBalanceEvent({
    required this.accountId,
    required this.amount,
  });

  @override
  List<Object?> get props => [accountId, amount];
}

class SeedDefaultAccountEvent extends AccountEvent {
  const SeedDefaultAccountEvent();

  @override
  List<Object?> get props => [];
}
