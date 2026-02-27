import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spently/features/account/domain/entities/account_entity.dart';

part 'account_event.freezed.dart';

@freezed
class AccountEvent with _$AccountEvent {
  const factory AccountEvent.loadAccounts() = LoadAccountsEvent;

  const factory AccountEvent.loadAccount({
    required String accountId,
  }) = LoadAccountEvent;

  const factory AccountEvent.create({
    required AccountEntity account,
  }) = CreateAccountEvent;

  const factory AccountEvent.update({
    required AccountEntity account,
  }) = UpdateAccountEvent;

  const factory AccountEvent.delete({
    required String accountId,
  }) = DeleteAccountEvent;

  const factory AccountEvent.updateBalance({
    required String accountId,
    required double amount,
  }) = UpdateAccountBalanceEvent;

  const factory AccountEvent.select({
    required String accountId,
  }) = SelectAccountEvent;
}
