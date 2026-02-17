import 'package:spently/core/usecases/usecase.dart';
import 'package:spently/features/account/presentation/bloc/account_event.dart';
import 'package:spently/features/account/presentation/bloc/account_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/account_usecases.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final GetAccountsUseCase _getAccounts;
  final GetAccountUseCase _getAccount;
  final CreateAccountUseCase _createAccount;
  final UpdateAccountUseCase _updateAccount;
  final DeleteAccountUseCase _deleteAccount;
  final UpdateAccountBalanceUseCase _updateAccountBalance;
  final SeedDefaultAccountUseCase _seedDefaultAccount;

  AccountBloc({
    required GetAccountsUseCase getAccounts,
    required GetAccountUseCase getAccount,
    required CreateAccountUseCase createAccount,
    required UpdateAccountUseCase updateAccount,
    required DeleteAccountUseCase deleteAccount,
    required UpdateAccountBalanceUseCase updateAccountBalance,
    required SeedDefaultAccountUseCase seedDefaultAccount,
  }) : _getAccounts = getAccounts,
       _getAccount = getAccount,
       _createAccount = createAccount,
       _updateAccount = updateAccount,
       _deleteAccount = deleteAccount,
       _updateAccountBalance = updateAccountBalance,
       _seedDefaultAccount = seedDefaultAccount,
       super(AccountInitial()) {
    on<LoadAccountsEvent>(_onLoadAccounts);
    on<LoadAccountEvent>(_onLoadAccount);
    on<CreateAccountEvent>(_onCreateAccount);
    on<UpdateAccountEvent>(_onUpdateAccount);
    on<DeleteAccountEvent>(_onDeleteAccount);
    on<UpdateAccountBalanceEvent>(_onUpdateAccountBalance);
    on<SeedDefaultAccountEvent>(_onSeedDefaultAccount);
  }

  Future<void> _onLoadAccounts(
    LoadAccountsEvent event,
    Emitter<AccountState> emit,
  ) async {
    emit(AccountLoading());

    // await _seedDefaultAccount(NoParams());

    final result = await _getAccounts(NoParams());

    result.fold((failure) => emit(AccountError(failure.msg)), (accounts) {
      final defaultAccount = accounts.firstWhere(
        (a) => a.isDefault,
        orElse: () => accounts.first,
      );
      emit(AccountsLoaded(accounts, defaultAccount));
    });
  }

  Future<void> _onLoadAccount(
    LoadAccountEvent event,
    Emitter<AccountState> emit,
  ) async {
    emit(AccountLoading());

    final result = await _getAccount(event.accountId);

    result.fold((failure) => emit(AccountError(failure.msg)), (account) {
      if (account != null) {
        emit(AccountLoaded(account));
      } else {
        emit(const AccountError('Account not found'));
      }
    });
  }

  Future<void> _onCreateAccount(
    CreateAccountEvent event,
    Emitter<AccountState> emit,
  ) async {
    emit(AccountLoading());

    final result = await _createAccount(event.account);

    result.fold(
      (failure) => emit(AccountError(failure.msg)),
      (account) => emit(AccountCreated(account)),
    );
  }

  Future<void> _onUpdateAccount(
    UpdateAccountEvent event,
    Emitter<AccountState> emit,
  ) async {
    emit(AccountLoading());

    final result = await _updateAccount(event.account);

    result.fold(
      (failure) => emit(AccountError(failure.msg)),
      (account) => emit(AccountUpdated(account)),
    );
  }

  Future<void> _onDeleteAccount(
    DeleteAccountEvent event,
    Emitter<AccountState> emit,
  ) async {
    emit(AccountLoading());

    final result = await _deleteAccount(event.accountId);

    result.fold(
      (failure) => emit(AccountError(failure.msg)),
      (_) => emit(AccountDeleted(event.accountId)),
    );
  }

  Future<void> _onUpdateAccountBalance(
    UpdateAccountBalanceEvent event,
    Emitter<AccountState> emit,
  ) async {
    final result = await _updateAccountBalance(
      UpdateAccountBalanceParams(
        accountId: event.accountId,
        amount: event.amount,
      ),
    );

    result.fold(
      (failure) => emit(AccountError(failure.msg)),
      (account) => emit(AccountBalanceUpdated(account)),
    );
  }

  Future<void> _onSeedDefaultAccount(
    SeedDefaultAccountEvent event,
    Emitter<AccountState> emit,
  ) async {
    emit(AccountLoading());

    final result = await _seedDefaultAccount(NoParams());

    result.fold(
      (failure) => emit(AccountError(failure.msg)),
      (_) => emit(DefaultAccountSeeded()),
    );
  }
}
