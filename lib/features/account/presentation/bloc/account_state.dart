import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spently/features/account/domain/entities/account_entity.dart';

part 'account_state.freezed.dart';

@freezed
class AccountState with _$AccountState {
  const AccountState._();

  const factory AccountState.initial() = AccountInitial;

  const factory AccountState.loading({
    @Default([]) List<AccountEntity> accounts,
    AccountEntity? selectedAccount,
  }) = AccountLoading;

  const factory AccountState.loaded({
    required List<AccountEntity> accounts,
    required AccountEntity selectedAccount,
  }) = AccountsLoaded;

  const factory AccountState.failure({
    required String message,
    @Default([]) List<AccountEntity> accounts,
    AccountEntity? selectedAccount,
  }) = AccountFailure;

  // Computed properties available on all states
  double get totalBalance => accounts.fold(0.0, (sum, a) => sum + a.balance);

  AccountEntity? get defaultAccount =>
      accounts.where((a) => a.isDefault).firstOrNull;

  // Getters that work across all states
  List<AccountEntity> get accounts => map(
        initial: (_) => [],
        loading: (s) => s.accounts,
        loaded: (s) => s.accounts,
        failure: (s) => s.accounts,
      );

  AccountEntity? get selectedAccount => mapOrNull(
        loading: (s) => s.selectedAccount,
        loaded: (s) => s.selectedAccount,
        failure: (s) => s.selectedAccount,
      );

  bool get isLoading => this is AccountLoading;
  bool get isLoaded => this is AccountsLoaded;
  bool get hasError => this is AccountFailure;
}
