// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadAccounts,
    required TResult Function(String accountId) loadAccount,
    required TResult Function(AccountEntity account) create,
    required TResult Function(AccountEntity account) update,
    required TResult Function(String accountId) delete,
    required TResult Function(String accountId, double amount) updateBalance,
    required TResult Function(String accountId) select,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadAccounts,
    TResult? Function(String accountId)? loadAccount,
    TResult? Function(AccountEntity account)? create,
    TResult? Function(AccountEntity account)? update,
    TResult? Function(String accountId)? delete,
    TResult? Function(String accountId, double amount)? updateBalance,
    TResult? Function(String accountId)? select,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadAccounts,
    TResult Function(String accountId)? loadAccount,
    TResult Function(AccountEntity account)? create,
    TResult Function(AccountEntity account)? update,
    TResult Function(String accountId)? delete,
    TResult Function(String accountId, double amount)? updateBalance,
    TResult Function(String accountId)? select,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadAccountsEvent value) loadAccounts,
    required TResult Function(LoadAccountEvent value) loadAccount,
    required TResult Function(CreateAccountEvent value) create,
    required TResult Function(UpdateAccountEvent value) update,
    required TResult Function(DeleteAccountEvent value) delete,
    required TResult Function(UpdateAccountBalanceEvent value) updateBalance,
    required TResult Function(SelectAccountEvent value) select,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadAccountsEvent value)? loadAccounts,
    TResult? Function(LoadAccountEvent value)? loadAccount,
    TResult? Function(CreateAccountEvent value)? create,
    TResult? Function(UpdateAccountEvent value)? update,
    TResult? Function(DeleteAccountEvent value)? delete,
    TResult? Function(UpdateAccountBalanceEvent value)? updateBalance,
    TResult? Function(SelectAccountEvent value)? select,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadAccountsEvent value)? loadAccounts,
    TResult Function(LoadAccountEvent value)? loadAccount,
    TResult Function(CreateAccountEvent value)? create,
    TResult Function(UpdateAccountEvent value)? update,
    TResult Function(DeleteAccountEvent value)? delete,
    TResult Function(UpdateAccountBalanceEvent value)? updateBalance,
    TResult Function(SelectAccountEvent value)? select,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountEventCopyWith<$Res> {
  factory $AccountEventCopyWith(
          AccountEvent value, $Res Function(AccountEvent) then) =
      _$AccountEventCopyWithImpl<$Res, AccountEvent>;
}

/// @nodoc
class _$AccountEventCopyWithImpl<$Res, $Val extends AccountEvent>
    implements $AccountEventCopyWith<$Res> {
  _$AccountEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadAccountsEventImplCopyWith<$Res> {
  factory _$$LoadAccountsEventImplCopyWith(_$LoadAccountsEventImpl value,
          $Res Function(_$LoadAccountsEventImpl) then) =
      __$$LoadAccountsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadAccountsEventImplCopyWithImpl<$Res>
    extends _$AccountEventCopyWithImpl<$Res, _$LoadAccountsEventImpl>
    implements _$$LoadAccountsEventImplCopyWith<$Res> {
  __$$LoadAccountsEventImplCopyWithImpl(_$LoadAccountsEventImpl _value,
      $Res Function(_$LoadAccountsEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadAccountsEventImpl implements LoadAccountsEvent {
  const _$LoadAccountsEventImpl();

  @override
  String toString() {
    return 'AccountEvent.loadAccounts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadAccountsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadAccounts,
    required TResult Function(String accountId) loadAccount,
    required TResult Function(AccountEntity account) create,
    required TResult Function(AccountEntity account) update,
    required TResult Function(String accountId) delete,
    required TResult Function(String accountId, double amount) updateBalance,
    required TResult Function(String accountId) select,
  }) {
    return loadAccounts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadAccounts,
    TResult? Function(String accountId)? loadAccount,
    TResult? Function(AccountEntity account)? create,
    TResult? Function(AccountEntity account)? update,
    TResult? Function(String accountId)? delete,
    TResult? Function(String accountId, double amount)? updateBalance,
    TResult? Function(String accountId)? select,
  }) {
    return loadAccounts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadAccounts,
    TResult Function(String accountId)? loadAccount,
    TResult Function(AccountEntity account)? create,
    TResult Function(AccountEntity account)? update,
    TResult Function(String accountId)? delete,
    TResult Function(String accountId, double amount)? updateBalance,
    TResult Function(String accountId)? select,
    required TResult orElse(),
  }) {
    if (loadAccounts != null) {
      return loadAccounts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadAccountsEvent value) loadAccounts,
    required TResult Function(LoadAccountEvent value) loadAccount,
    required TResult Function(CreateAccountEvent value) create,
    required TResult Function(UpdateAccountEvent value) update,
    required TResult Function(DeleteAccountEvent value) delete,
    required TResult Function(UpdateAccountBalanceEvent value) updateBalance,
    required TResult Function(SelectAccountEvent value) select,
  }) {
    return loadAccounts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadAccountsEvent value)? loadAccounts,
    TResult? Function(LoadAccountEvent value)? loadAccount,
    TResult? Function(CreateAccountEvent value)? create,
    TResult? Function(UpdateAccountEvent value)? update,
    TResult? Function(DeleteAccountEvent value)? delete,
    TResult? Function(UpdateAccountBalanceEvent value)? updateBalance,
    TResult? Function(SelectAccountEvent value)? select,
  }) {
    return loadAccounts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadAccountsEvent value)? loadAccounts,
    TResult Function(LoadAccountEvent value)? loadAccount,
    TResult Function(CreateAccountEvent value)? create,
    TResult Function(UpdateAccountEvent value)? update,
    TResult Function(DeleteAccountEvent value)? delete,
    TResult Function(UpdateAccountBalanceEvent value)? updateBalance,
    TResult Function(SelectAccountEvent value)? select,
    required TResult orElse(),
  }) {
    if (loadAccounts != null) {
      return loadAccounts(this);
    }
    return orElse();
  }
}

abstract class LoadAccountsEvent implements AccountEvent {
  const factory LoadAccountsEvent() = _$LoadAccountsEventImpl;
}

/// @nodoc
abstract class _$$LoadAccountEventImplCopyWith<$Res> {
  factory _$$LoadAccountEventImplCopyWith(_$LoadAccountEventImpl value,
          $Res Function(_$LoadAccountEventImpl) then) =
      __$$LoadAccountEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String accountId});
}

/// @nodoc
class __$$LoadAccountEventImplCopyWithImpl<$Res>
    extends _$AccountEventCopyWithImpl<$Res, _$LoadAccountEventImpl>
    implements _$$LoadAccountEventImplCopyWith<$Res> {
  __$$LoadAccountEventImplCopyWithImpl(_$LoadAccountEventImpl _value,
      $Res Function(_$LoadAccountEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
  }) {
    return _then(_$LoadAccountEventImpl(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadAccountEventImpl implements LoadAccountEvent {
  const _$LoadAccountEventImpl({required this.accountId});

  @override
  final String accountId;

  @override
  String toString() {
    return 'AccountEvent.loadAccount(accountId: $accountId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadAccountEventImpl &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accountId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadAccountEventImplCopyWith<_$LoadAccountEventImpl> get copyWith =>
      __$$LoadAccountEventImplCopyWithImpl<_$LoadAccountEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadAccounts,
    required TResult Function(String accountId) loadAccount,
    required TResult Function(AccountEntity account) create,
    required TResult Function(AccountEntity account) update,
    required TResult Function(String accountId) delete,
    required TResult Function(String accountId, double amount) updateBalance,
    required TResult Function(String accountId) select,
  }) {
    return loadAccount(accountId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadAccounts,
    TResult? Function(String accountId)? loadAccount,
    TResult? Function(AccountEntity account)? create,
    TResult? Function(AccountEntity account)? update,
    TResult? Function(String accountId)? delete,
    TResult? Function(String accountId, double amount)? updateBalance,
    TResult? Function(String accountId)? select,
  }) {
    return loadAccount?.call(accountId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadAccounts,
    TResult Function(String accountId)? loadAccount,
    TResult Function(AccountEntity account)? create,
    TResult Function(AccountEntity account)? update,
    TResult Function(String accountId)? delete,
    TResult Function(String accountId, double amount)? updateBalance,
    TResult Function(String accountId)? select,
    required TResult orElse(),
  }) {
    if (loadAccount != null) {
      return loadAccount(accountId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadAccountsEvent value) loadAccounts,
    required TResult Function(LoadAccountEvent value) loadAccount,
    required TResult Function(CreateAccountEvent value) create,
    required TResult Function(UpdateAccountEvent value) update,
    required TResult Function(DeleteAccountEvent value) delete,
    required TResult Function(UpdateAccountBalanceEvent value) updateBalance,
    required TResult Function(SelectAccountEvent value) select,
  }) {
    return loadAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadAccountsEvent value)? loadAccounts,
    TResult? Function(LoadAccountEvent value)? loadAccount,
    TResult? Function(CreateAccountEvent value)? create,
    TResult? Function(UpdateAccountEvent value)? update,
    TResult? Function(DeleteAccountEvent value)? delete,
    TResult? Function(UpdateAccountBalanceEvent value)? updateBalance,
    TResult? Function(SelectAccountEvent value)? select,
  }) {
    return loadAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadAccountsEvent value)? loadAccounts,
    TResult Function(LoadAccountEvent value)? loadAccount,
    TResult Function(CreateAccountEvent value)? create,
    TResult Function(UpdateAccountEvent value)? update,
    TResult Function(DeleteAccountEvent value)? delete,
    TResult Function(UpdateAccountBalanceEvent value)? updateBalance,
    TResult Function(SelectAccountEvent value)? select,
    required TResult orElse(),
  }) {
    if (loadAccount != null) {
      return loadAccount(this);
    }
    return orElse();
  }
}

abstract class LoadAccountEvent implements AccountEvent {
  const factory LoadAccountEvent({required final String accountId}) =
      _$LoadAccountEventImpl;

  String get accountId;
  @JsonKey(ignore: true)
  _$$LoadAccountEventImplCopyWith<_$LoadAccountEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateAccountEventImplCopyWith<$Res> {
  factory _$$CreateAccountEventImplCopyWith(_$CreateAccountEventImpl value,
          $Res Function(_$CreateAccountEventImpl) then) =
      __$$CreateAccountEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AccountEntity account});
}

/// @nodoc
class __$$CreateAccountEventImplCopyWithImpl<$Res>
    extends _$AccountEventCopyWithImpl<$Res, _$CreateAccountEventImpl>
    implements _$$CreateAccountEventImplCopyWith<$Res> {
  __$$CreateAccountEventImplCopyWithImpl(_$CreateAccountEventImpl _value,
      $Res Function(_$CreateAccountEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
  }) {
    return _then(_$CreateAccountEventImpl(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as AccountEntity,
    ));
  }
}

/// @nodoc

class _$CreateAccountEventImpl implements CreateAccountEvent {
  const _$CreateAccountEventImpl({required this.account});

  @override
  final AccountEntity account;

  @override
  String toString() {
    return 'AccountEvent.create(account: $account)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateAccountEventImpl &&
            (identical(other.account, account) || other.account == account));
  }

  @override
  int get hashCode => Object.hash(runtimeType, account);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateAccountEventImplCopyWith<_$CreateAccountEventImpl> get copyWith =>
      __$$CreateAccountEventImplCopyWithImpl<_$CreateAccountEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadAccounts,
    required TResult Function(String accountId) loadAccount,
    required TResult Function(AccountEntity account) create,
    required TResult Function(AccountEntity account) update,
    required TResult Function(String accountId) delete,
    required TResult Function(String accountId, double amount) updateBalance,
    required TResult Function(String accountId) select,
  }) {
    return create(account);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadAccounts,
    TResult? Function(String accountId)? loadAccount,
    TResult? Function(AccountEntity account)? create,
    TResult? Function(AccountEntity account)? update,
    TResult? Function(String accountId)? delete,
    TResult? Function(String accountId, double amount)? updateBalance,
    TResult? Function(String accountId)? select,
  }) {
    return create?.call(account);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadAccounts,
    TResult Function(String accountId)? loadAccount,
    TResult Function(AccountEntity account)? create,
    TResult Function(AccountEntity account)? update,
    TResult Function(String accountId)? delete,
    TResult Function(String accountId, double amount)? updateBalance,
    TResult Function(String accountId)? select,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(account);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadAccountsEvent value) loadAccounts,
    required TResult Function(LoadAccountEvent value) loadAccount,
    required TResult Function(CreateAccountEvent value) create,
    required TResult Function(UpdateAccountEvent value) update,
    required TResult Function(DeleteAccountEvent value) delete,
    required TResult Function(UpdateAccountBalanceEvent value) updateBalance,
    required TResult Function(SelectAccountEvent value) select,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadAccountsEvent value)? loadAccounts,
    TResult? Function(LoadAccountEvent value)? loadAccount,
    TResult? Function(CreateAccountEvent value)? create,
    TResult? Function(UpdateAccountEvent value)? update,
    TResult? Function(DeleteAccountEvent value)? delete,
    TResult? Function(UpdateAccountBalanceEvent value)? updateBalance,
    TResult? Function(SelectAccountEvent value)? select,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadAccountsEvent value)? loadAccounts,
    TResult Function(LoadAccountEvent value)? loadAccount,
    TResult Function(CreateAccountEvent value)? create,
    TResult Function(UpdateAccountEvent value)? update,
    TResult Function(DeleteAccountEvent value)? delete,
    TResult Function(UpdateAccountBalanceEvent value)? updateBalance,
    TResult Function(SelectAccountEvent value)? select,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class CreateAccountEvent implements AccountEvent {
  const factory CreateAccountEvent({required final AccountEntity account}) =
      _$CreateAccountEventImpl;

  AccountEntity get account;
  @JsonKey(ignore: true)
  _$$CreateAccountEventImplCopyWith<_$CreateAccountEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateAccountEventImplCopyWith<$Res> {
  factory _$$UpdateAccountEventImplCopyWith(_$UpdateAccountEventImpl value,
          $Res Function(_$UpdateAccountEventImpl) then) =
      __$$UpdateAccountEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AccountEntity account});
}

/// @nodoc
class __$$UpdateAccountEventImplCopyWithImpl<$Res>
    extends _$AccountEventCopyWithImpl<$Res, _$UpdateAccountEventImpl>
    implements _$$UpdateAccountEventImplCopyWith<$Res> {
  __$$UpdateAccountEventImplCopyWithImpl(_$UpdateAccountEventImpl _value,
      $Res Function(_$UpdateAccountEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
  }) {
    return _then(_$UpdateAccountEventImpl(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as AccountEntity,
    ));
  }
}

/// @nodoc

class _$UpdateAccountEventImpl implements UpdateAccountEvent {
  const _$UpdateAccountEventImpl({required this.account});

  @override
  final AccountEntity account;

  @override
  String toString() {
    return 'AccountEvent.update(account: $account)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateAccountEventImpl &&
            (identical(other.account, account) || other.account == account));
  }

  @override
  int get hashCode => Object.hash(runtimeType, account);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateAccountEventImplCopyWith<_$UpdateAccountEventImpl> get copyWith =>
      __$$UpdateAccountEventImplCopyWithImpl<_$UpdateAccountEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadAccounts,
    required TResult Function(String accountId) loadAccount,
    required TResult Function(AccountEntity account) create,
    required TResult Function(AccountEntity account) update,
    required TResult Function(String accountId) delete,
    required TResult Function(String accountId, double amount) updateBalance,
    required TResult Function(String accountId) select,
  }) {
    return update(account);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadAccounts,
    TResult? Function(String accountId)? loadAccount,
    TResult? Function(AccountEntity account)? create,
    TResult? Function(AccountEntity account)? update,
    TResult? Function(String accountId)? delete,
    TResult? Function(String accountId, double amount)? updateBalance,
    TResult? Function(String accountId)? select,
  }) {
    return update?.call(account);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadAccounts,
    TResult Function(String accountId)? loadAccount,
    TResult Function(AccountEntity account)? create,
    TResult Function(AccountEntity account)? update,
    TResult Function(String accountId)? delete,
    TResult Function(String accountId, double amount)? updateBalance,
    TResult Function(String accountId)? select,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(account);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadAccountsEvent value) loadAccounts,
    required TResult Function(LoadAccountEvent value) loadAccount,
    required TResult Function(CreateAccountEvent value) create,
    required TResult Function(UpdateAccountEvent value) update,
    required TResult Function(DeleteAccountEvent value) delete,
    required TResult Function(UpdateAccountBalanceEvent value) updateBalance,
    required TResult Function(SelectAccountEvent value) select,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadAccountsEvent value)? loadAccounts,
    TResult? Function(LoadAccountEvent value)? loadAccount,
    TResult? Function(CreateAccountEvent value)? create,
    TResult? Function(UpdateAccountEvent value)? update,
    TResult? Function(DeleteAccountEvent value)? delete,
    TResult? Function(UpdateAccountBalanceEvent value)? updateBalance,
    TResult? Function(SelectAccountEvent value)? select,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadAccountsEvent value)? loadAccounts,
    TResult Function(LoadAccountEvent value)? loadAccount,
    TResult Function(CreateAccountEvent value)? create,
    TResult Function(UpdateAccountEvent value)? update,
    TResult Function(DeleteAccountEvent value)? delete,
    TResult Function(UpdateAccountBalanceEvent value)? updateBalance,
    TResult Function(SelectAccountEvent value)? select,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class UpdateAccountEvent implements AccountEvent {
  const factory UpdateAccountEvent({required final AccountEntity account}) =
      _$UpdateAccountEventImpl;

  AccountEntity get account;
  @JsonKey(ignore: true)
  _$$UpdateAccountEventImplCopyWith<_$UpdateAccountEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteAccountEventImplCopyWith<$Res> {
  factory _$$DeleteAccountEventImplCopyWith(_$DeleteAccountEventImpl value,
          $Res Function(_$DeleteAccountEventImpl) then) =
      __$$DeleteAccountEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String accountId});
}

/// @nodoc
class __$$DeleteAccountEventImplCopyWithImpl<$Res>
    extends _$AccountEventCopyWithImpl<$Res, _$DeleteAccountEventImpl>
    implements _$$DeleteAccountEventImplCopyWith<$Res> {
  __$$DeleteAccountEventImplCopyWithImpl(_$DeleteAccountEventImpl _value,
      $Res Function(_$DeleteAccountEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
  }) {
    return _then(_$DeleteAccountEventImpl(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteAccountEventImpl implements DeleteAccountEvent {
  const _$DeleteAccountEventImpl({required this.accountId});

  @override
  final String accountId;

  @override
  String toString() {
    return 'AccountEvent.delete(accountId: $accountId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteAccountEventImpl &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accountId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteAccountEventImplCopyWith<_$DeleteAccountEventImpl> get copyWith =>
      __$$DeleteAccountEventImplCopyWithImpl<_$DeleteAccountEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadAccounts,
    required TResult Function(String accountId) loadAccount,
    required TResult Function(AccountEntity account) create,
    required TResult Function(AccountEntity account) update,
    required TResult Function(String accountId) delete,
    required TResult Function(String accountId, double amount) updateBalance,
    required TResult Function(String accountId) select,
  }) {
    return delete(accountId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadAccounts,
    TResult? Function(String accountId)? loadAccount,
    TResult? Function(AccountEntity account)? create,
    TResult? Function(AccountEntity account)? update,
    TResult? Function(String accountId)? delete,
    TResult? Function(String accountId, double amount)? updateBalance,
    TResult? Function(String accountId)? select,
  }) {
    return delete?.call(accountId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadAccounts,
    TResult Function(String accountId)? loadAccount,
    TResult Function(AccountEntity account)? create,
    TResult Function(AccountEntity account)? update,
    TResult Function(String accountId)? delete,
    TResult Function(String accountId, double amount)? updateBalance,
    TResult Function(String accountId)? select,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(accountId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadAccountsEvent value) loadAccounts,
    required TResult Function(LoadAccountEvent value) loadAccount,
    required TResult Function(CreateAccountEvent value) create,
    required TResult Function(UpdateAccountEvent value) update,
    required TResult Function(DeleteAccountEvent value) delete,
    required TResult Function(UpdateAccountBalanceEvent value) updateBalance,
    required TResult Function(SelectAccountEvent value) select,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadAccountsEvent value)? loadAccounts,
    TResult? Function(LoadAccountEvent value)? loadAccount,
    TResult? Function(CreateAccountEvent value)? create,
    TResult? Function(UpdateAccountEvent value)? update,
    TResult? Function(DeleteAccountEvent value)? delete,
    TResult? Function(UpdateAccountBalanceEvent value)? updateBalance,
    TResult? Function(SelectAccountEvent value)? select,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadAccountsEvent value)? loadAccounts,
    TResult Function(LoadAccountEvent value)? loadAccount,
    TResult Function(CreateAccountEvent value)? create,
    TResult Function(UpdateAccountEvent value)? update,
    TResult Function(DeleteAccountEvent value)? delete,
    TResult Function(UpdateAccountBalanceEvent value)? updateBalance,
    TResult Function(SelectAccountEvent value)? select,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class DeleteAccountEvent implements AccountEvent {
  const factory DeleteAccountEvent({required final String accountId}) =
      _$DeleteAccountEventImpl;

  String get accountId;
  @JsonKey(ignore: true)
  _$$DeleteAccountEventImplCopyWith<_$DeleteAccountEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateAccountBalanceEventImplCopyWith<$Res> {
  factory _$$UpdateAccountBalanceEventImplCopyWith(
          _$UpdateAccountBalanceEventImpl value,
          $Res Function(_$UpdateAccountBalanceEventImpl) then) =
      __$$UpdateAccountBalanceEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String accountId, double amount});
}

/// @nodoc
class __$$UpdateAccountBalanceEventImplCopyWithImpl<$Res>
    extends _$AccountEventCopyWithImpl<$Res, _$UpdateAccountBalanceEventImpl>
    implements _$$UpdateAccountBalanceEventImplCopyWith<$Res> {
  __$$UpdateAccountBalanceEventImplCopyWithImpl(
      _$UpdateAccountBalanceEventImpl _value,
      $Res Function(_$UpdateAccountBalanceEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? amount = null,
  }) {
    return _then(_$UpdateAccountBalanceEventImpl(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$UpdateAccountBalanceEventImpl implements UpdateAccountBalanceEvent {
  const _$UpdateAccountBalanceEventImpl(
      {required this.accountId, required this.amount});

  @override
  final String accountId;
  @override
  final double amount;

  @override
  String toString() {
    return 'AccountEvent.updateBalance(accountId: $accountId, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateAccountBalanceEventImpl &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accountId, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateAccountBalanceEventImplCopyWith<_$UpdateAccountBalanceEventImpl>
      get copyWith => __$$UpdateAccountBalanceEventImplCopyWithImpl<
          _$UpdateAccountBalanceEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadAccounts,
    required TResult Function(String accountId) loadAccount,
    required TResult Function(AccountEntity account) create,
    required TResult Function(AccountEntity account) update,
    required TResult Function(String accountId) delete,
    required TResult Function(String accountId, double amount) updateBalance,
    required TResult Function(String accountId) select,
  }) {
    return updateBalance(accountId, amount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadAccounts,
    TResult? Function(String accountId)? loadAccount,
    TResult? Function(AccountEntity account)? create,
    TResult? Function(AccountEntity account)? update,
    TResult? Function(String accountId)? delete,
    TResult? Function(String accountId, double amount)? updateBalance,
    TResult? Function(String accountId)? select,
  }) {
    return updateBalance?.call(accountId, amount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadAccounts,
    TResult Function(String accountId)? loadAccount,
    TResult Function(AccountEntity account)? create,
    TResult Function(AccountEntity account)? update,
    TResult Function(String accountId)? delete,
    TResult Function(String accountId, double amount)? updateBalance,
    TResult Function(String accountId)? select,
    required TResult orElse(),
  }) {
    if (updateBalance != null) {
      return updateBalance(accountId, amount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadAccountsEvent value) loadAccounts,
    required TResult Function(LoadAccountEvent value) loadAccount,
    required TResult Function(CreateAccountEvent value) create,
    required TResult Function(UpdateAccountEvent value) update,
    required TResult Function(DeleteAccountEvent value) delete,
    required TResult Function(UpdateAccountBalanceEvent value) updateBalance,
    required TResult Function(SelectAccountEvent value) select,
  }) {
    return updateBalance(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadAccountsEvent value)? loadAccounts,
    TResult? Function(LoadAccountEvent value)? loadAccount,
    TResult? Function(CreateAccountEvent value)? create,
    TResult? Function(UpdateAccountEvent value)? update,
    TResult? Function(DeleteAccountEvent value)? delete,
    TResult? Function(UpdateAccountBalanceEvent value)? updateBalance,
    TResult? Function(SelectAccountEvent value)? select,
  }) {
    return updateBalance?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadAccountsEvent value)? loadAccounts,
    TResult Function(LoadAccountEvent value)? loadAccount,
    TResult Function(CreateAccountEvent value)? create,
    TResult Function(UpdateAccountEvent value)? update,
    TResult Function(DeleteAccountEvent value)? delete,
    TResult Function(UpdateAccountBalanceEvent value)? updateBalance,
    TResult Function(SelectAccountEvent value)? select,
    required TResult orElse(),
  }) {
    if (updateBalance != null) {
      return updateBalance(this);
    }
    return orElse();
  }
}

abstract class UpdateAccountBalanceEvent implements AccountEvent {
  const factory UpdateAccountBalanceEvent(
      {required final String accountId,
      required final double amount}) = _$UpdateAccountBalanceEventImpl;

  String get accountId;
  double get amount;
  @JsonKey(ignore: true)
  _$$UpdateAccountBalanceEventImplCopyWith<_$UpdateAccountBalanceEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectAccountEventImplCopyWith<$Res> {
  factory _$$SelectAccountEventImplCopyWith(_$SelectAccountEventImpl value,
          $Res Function(_$SelectAccountEventImpl) then) =
      __$$SelectAccountEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String accountId});
}

/// @nodoc
class __$$SelectAccountEventImplCopyWithImpl<$Res>
    extends _$AccountEventCopyWithImpl<$Res, _$SelectAccountEventImpl>
    implements _$$SelectAccountEventImplCopyWith<$Res> {
  __$$SelectAccountEventImplCopyWithImpl(_$SelectAccountEventImpl _value,
      $Res Function(_$SelectAccountEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
  }) {
    return _then(_$SelectAccountEventImpl(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SelectAccountEventImpl implements SelectAccountEvent {
  const _$SelectAccountEventImpl({required this.accountId});

  @override
  final String accountId;

  @override
  String toString() {
    return 'AccountEvent.select(accountId: $accountId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectAccountEventImpl &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accountId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectAccountEventImplCopyWith<_$SelectAccountEventImpl> get copyWith =>
      __$$SelectAccountEventImplCopyWithImpl<_$SelectAccountEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadAccounts,
    required TResult Function(String accountId) loadAccount,
    required TResult Function(AccountEntity account) create,
    required TResult Function(AccountEntity account) update,
    required TResult Function(String accountId) delete,
    required TResult Function(String accountId, double amount) updateBalance,
    required TResult Function(String accountId) select,
  }) {
    return select(accountId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadAccounts,
    TResult? Function(String accountId)? loadAccount,
    TResult? Function(AccountEntity account)? create,
    TResult? Function(AccountEntity account)? update,
    TResult? Function(String accountId)? delete,
    TResult? Function(String accountId, double amount)? updateBalance,
    TResult? Function(String accountId)? select,
  }) {
    return select?.call(accountId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadAccounts,
    TResult Function(String accountId)? loadAccount,
    TResult Function(AccountEntity account)? create,
    TResult Function(AccountEntity account)? update,
    TResult Function(String accountId)? delete,
    TResult Function(String accountId, double amount)? updateBalance,
    TResult Function(String accountId)? select,
    required TResult orElse(),
  }) {
    if (select != null) {
      return select(accountId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadAccountsEvent value) loadAccounts,
    required TResult Function(LoadAccountEvent value) loadAccount,
    required TResult Function(CreateAccountEvent value) create,
    required TResult Function(UpdateAccountEvent value) update,
    required TResult Function(DeleteAccountEvent value) delete,
    required TResult Function(UpdateAccountBalanceEvent value) updateBalance,
    required TResult Function(SelectAccountEvent value) select,
  }) {
    return select(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadAccountsEvent value)? loadAccounts,
    TResult? Function(LoadAccountEvent value)? loadAccount,
    TResult? Function(CreateAccountEvent value)? create,
    TResult? Function(UpdateAccountEvent value)? update,
    TResult? Function(DeleteAccountEvent value)? delete,
    TResult? Function(UpdateAccountBalanceEvent value)? updateBalance,
    TResult? Function(SelectAccountEvent value)? select,
  }) {
    return select?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadAccountsEvent value)? loadAccounts,
    TResult Function(LoadAccountEvent value)? loadAccount,
    TResult Function(CreateAccountEvent value)? create,
    TResult Function(UpdateAccountEvent value)? update,
    TResult Function(DeleteAccountEvent value)? delete,
    TResult Function(UpdateAccountBalanceEvent value)? updateBalance,
    TResult Function(SelectAccountEvent value)? select,
    required TResult orElse(),
  }) {
    if (select != null) {
      return select(this);
    }
    return orElse();
  }
}

abstract class SelectAccountEvent implements AccountEvent {
  const factory SelectAccountEvent({required final String accountId}) =
      _$SelectAccountEventImpl;

  String get accountId;
  @JsonKey(ignore: true)
  _$$SelectAccountEventImplCopyWith<_$SelectAccountEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
