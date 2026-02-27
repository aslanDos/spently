import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spently/core/usecases/usecase.dart';
import 'package:spently/features/account/domain/entities/account_entity.dart';
import 'package:spently/features/account/domain/usecases/account_usecases.dart';
import 'package:spently/features/account/presentation/bloc/account_event.dart';
import 'package:spently/features/account/presentation/bloc/account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final GetAccountsUseCase _getAccounts;
  final GetAccountUseCase _getAccount;
  final CreateAccountUseCase _createAccount;
  final UpdateAccountUseCase _updateAccount;
  final DeleteAccountUseCase _deleteAccount;
  final UpdateAccountBalanceUseCase _updateAccountBalance;
  final SeedDefaultAccountUseCase _seedDefaultAccount;

  bool _hasSeededDefault = false;

  AccountBloc({
    required GetAccountsUseCase getAccounts,
    required GetAccountUseCase getAccount,
    required CreateAccountUseCase createAccount,
    required UpdateAccountUseCase updateAccount,
    required DeleteAccountUseCase deleteAccount,
    required UpdateAccountBalanceUseCase updateAccountBalance,
    required SeedDefaultAccountUseCase seedDefaultAccount,
  })  : _getAccounts = getAccounts,
        _getAccount = getAccount,
        _createAccount = createAccount,
        _updateAccount = updateAccount,
        _deleteAccount = deleteAccount,
        _updateAccountBalance = updateAccountBalance,
        _seedDefaultAccount = seedDefaultAccount,
        super(const AccountState.initial()) {
    on<LoadAccountsEvent>(_onLoadAccounts);
    on<LoadAccountEvent>(_onLoadAccount);
    on<CreateAccountEvent>(_onCreateAccount);
    on<UpdateAccountEvent>(_onUpdateAccount);
    on<DeleteAccountEvent>(_onDeleteAccount);
    on<UpdateAccountBalanceEvent>(_onUpdateAccountBalance);
    on<SelectAccountEvent>(_onSelectAccount);
  }

  Future<void> _onLoadAccounts(
    LoadAccountsEvent event,
    Emitter<AccountState> emit,
  ) async {
    final currentSelected = state.selectedAccount;

    emit(AccountState.loading(
      accounts: state.accounts,
      selectedAccount: currentSelected,
    ));

    // Seed default account only once per bloc lifetime
    if (!_hasSeededDefault) {
      await _seedDefaultAccount(NoParams());
      _hasSeededDefault = true;
    }

    final result = await _getAccounts(NoParams());

    result.fold(
      (failure) => emit(AccountState.failure(
        message: failure.msg,
        accounts: state.accounts,
        selectedAccount: currentSelected,
      )),
      (accounts) => _emitAccountsOrFailure(
        emit: emit,
        accounts: accounts,
        previousSelected: currentSelected,
      ),
    );
  }

  Future<void> _onLoadAccount(
    LoadAccountEvent event,
    Emitter<AccountState> emit,
  ) async {
    emit(AccountState.loading(
      accounts: state.accounts,
      selectedAccount: state.selectedAccount,
    ));

    final result = await _getAccount(event.accountId);

    result.fold(
      (failure) => emit(AccountState.failure(
        message: failure.msg,
        accounts: state.accounts,
        selectedAccount: state.selectedAccount,
      )),
      (account) {
        if (account != null) {
          final updatedAccounts = state.accounts.map((a) {
            return a.id == account.id ? account : a;
          }).toList();

          // Preserve selection, only update if selected account was refreshed
          final selectedAccount = state.selectedAccount?.id == account.id
              ? account
              : state.selectedAccount ?? account;

          emit(AccountState.loaded(
            accounts: updatedAccounts,
            selectedAccount: selectedAccount,
          ));
        } else {
          emit(AccountState.failure(
            message: 'Account not found',
            accounts: state.accounts,
            selectedAccount: state.selectedAccount,
          ));
        }
      },
    );
  }

  Future<void> _onCreateAccount(
    CreateAccountEvent event,
    Emitter<AccountState> emit,
  ) async {
    emit(AccountState.loading(
      accounts: state.accounts,
      selectedAccount: state.selectedAccount,
    ));

    final result = await _createAccount(event.account);

    await result.fold(
      (failure) async => emit(AccountState.failure(
        message: failure.msg,
        accounts: state.accounts,
        selectedAccount: state.selectedAccount,
      )),
      (_) async => await _refreshAccounts(emit, selectAccountId: event.account.id),
    );
  }

  Future<void> _onUpdateAccount(
    UpdateAccountEvent event,
    Emitter<AccountState> emit,
  ) async {
    emit(AccountState.loading(
      accounts: state.accounts,
      selectedAccount: state.selectedAccount,
    ));

    final result = await _updateAccount(event.account);

    await result.fold(
      (failure) async => emit(AccountState.failure(
        message: failure.msg,
        accounts: state.accounts,
        selectedAccount: state.selectedAccount,
      )),
      (_) async => await _refreshAccounts(emit, selectAccountId: event.account.id),
    );
  }

  Future<void> _onDeleteAccount(
    DeleteAccountEvent event,
    Emitter<AccountState> emit,
  ) async {
    emit(AccountState.loading(
      accounts: state.accounts,
      selectedAccount: state.selectedAccount,
    ));

    final result = await _deleteAccount(event.accountId);

    await result.fold(
      (failure) async => emit(AccountState.failure(
        message: failure.msg,
        accounts: state.accounts,
        selectedAccount: state.selectedAccount,
      )),
      (_) async => await _refreshAccounts(emit),
    );
  }

  Future<void> _onUpdateAccountBalance(
    UpdateAccountBalanceEvent event,
    Emitter<AccountState> emit,
  ) async {
    emit(AccountState.loading(
      accounts: state.accounts,
      selectedAccount: state.selectedAccount,
    ));

    final result = await _updateAccountBalance(
      UpdateAccountBalanceParams(
        accountId: event.accountId,
        amount: event.amount,
      ),
    );

    result.fold(
      (failure) => emit(AccountState.failure(
        message: failure.msg,
        accounts: state.accounts,
        selectedAccount: state.selectedAccount,
      )),
      (updatedAccount) {
        final updatedAccounts = state.accounts.map((a) {
          return a.id == updatedAccount.id ? updatedAccount : a;
        }).toList();

        emit(AccountState.loaded(
          accounts: updatedAccounts,
          selectedAccount: _resolveSelectedAccount(
            accounts: updatedAccounts,
            previousSelected: state.selectedAccount,
          ),
        ));
      },
    );
  }

  void _onSelectAccount(
    SelectAccountEvent event,
    Emitter<AccountState> emit,
  ) {
    // Only allow selection when in loaded state
    if (!state.isLoaded) return;

    final accounts = state.accounts;
    if (accounts.isEmpty) return;

    final selectedAccount = accounts.firstWhere(
      (a) => a.id == event.accountId,
      orElse: () => accounts.first,
    );

    emit(AccountState.loaded(
      accounts: accounts,
      selectedAccount: selectedAccount,
    ));
  }

  // Helper method to refresh accounts after mutations
  Future<void> _refreshAccounts(
    Emitter<AccountState> emit, {
    String? selectAccountId,
  }) async {
    final result = await _getAccounts(NoParams());

    result.fold(
      (failure) => emit(AccountState.failure(
        message: failure.msg,
        accounts: state.accounts,
        selectedAccount: state.selectedAccount,
      )),
      (accounts) => _emitAccountsOrFailure(
        emit: emit,
        accounts: accounts,
        previousSelected: state.selectedAccount,
        preferredId: selectAccountId,
      ),
    );
  }

  // Helper to emit loaded state or failure if empty
  void _emitAccountsOrFailure({
    required Emitter<AccountState> emit,
    required List<AccountEntity> accounts,
    AccountEntity? previousSelected,
    String? preferredId,
  }) {
    if (accounts.isEmpty) {
      emit(const AccountState.failure(
        message: 'No accounts found',
        accounts: [],
      ));
      return;
    }

    final selectedAccount = _resolveSelectedAccount(
      accounts: accounts,
      previousSelected: previousSelected,
      preferredId: preferredId,
    );

    emit(AccountState.loaded(
      accounts: accounts,
      selectedAccount: selectedAccount,
    ));
  }

  // Helper to resolve which account should be selected
  AccountEntity _resolveSelectedAccount({
    required List<AccountEntity> accounts,
    AccountEntity? previousSelected,
    String? preferredId,
  }) {
    // First try preferred ID (e.g., newly created account)
    if (preferredId != null) {
      final preferred = accounts.where((a) => a.id == preferredId).firstOrNull;
      if (preferred != null) return preferred;
    }

    // Then try previously selected
    if (previousSelected != null) {
      final previous = accounts.where((a) => a.id == previousSelected.id).firstOrNull;
      if (previous != null) return previous;
    }

    // Then try default account
    final defaultAccount = accounts.where((a) => a.isDefault).firstOrNull;
    if (defaultAccount != null) return defaultAccount;

    // Finally, just return first
    return accounts.first;
  }
}
