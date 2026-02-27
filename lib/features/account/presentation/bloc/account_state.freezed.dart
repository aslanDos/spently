// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<AccountEntity> accounts, AccountEntity? selectedAccount)
        loading,
    required TResult Function(
            List<AccountEntity> accounts, AccountEntity selectedAccount)
        loaded,
    required TResult Function(String message, List<AccountEntity> accounts,
            AccountEntity? selectedAccount)
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<AccountEntity> accounts, AccountEntity? selectedAccount)?
        loading,
    TResult? Function(
            List<AccountEntity> accounts, AccountEntity selectedAccount)?
        loaded,
    TResult? Function(String message, List<AccountEntity> accounts,
            AccountEntity? selectedAccount)?
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<AccountEntity> accounts, AccountEntity? selectedAccount)?
        loading,
    TResult Function(
            List<AccountEntity> accounts, AccountEntity selectedAccount)?
        loaded,
    TResult Function(String message, List<AccountEntity> accounts,
            AccountEntity? selectedAccount)?
        failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInitial value) initial,
    required TResult Function(AccountLoading value) loading,
    required TResult Function(AccountsLoaded value) loaded,
    required TResult Function(AccountFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountInitial value)? initial,
    TResult? Function(AccountLoading value)? loading,
    TResult? Function(AccountsLoaded value)? loaded,
    TResult? Function(AccountFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInitial value)? initial,
    TResult Function(AccountLoading value)? loading,
    TResult Function(AccountsLoaded value)? loaded,
    TResult Function(AccountFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountStateCopyWith<$Res> {
  factory $AccountStateCopyWith(
          AccountState value, $Res Function(AccountState) then) =
      _$AccountStateCopyWithImpl<$Res, AccountState>;
}

/// @nodoc
class _$AccountStateCopyWithImpl<$Res, $Val extends AccountState>
    implements $AccountStateCopyWith<$Res> {
  _$AccountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AccountInitialImplCopyWith<$Res> {
  factory _$$AccountInitialImplCopyWith(_$AccountInitialImpl value,
          $Res Function(_$AccountInitialImpl) then) =
      __$$AccountInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AccountInitialImplCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$AccountInitialImpl>
    implements _$$AccountInitialImplCopyWith<$Res> {
  __$$AccountInitialImplCopyWithImpl(
      _$AccountInitialImpl _value, $Res Function(_$AccountInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AccountInitialImpl extends AccountInitial {
  const _$AccountInitialImpl() : super._();

  @override
  String toString() {
    return 'AccountState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AccountInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<AccountEntity> accounts, AccountEntity? selectedAccount)
        loading,
    required TResult Function(
            List<AccountEntity> accounts, AccountEntity selectedAccount)
        loaded,
    required TResult Function(String message, List<AccountEntity> accounts,
            AccountEntity? selectedAccount)
        failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<AccountEntity> accounts, AccountEntity? selectedAccount)?
        loading,
    TResult? Function(
            List<AccountEntity> accounts, AccountEntity selectedAccount)?
        loaded,
    TResult? Function(String message, List<AccountEntity> accounts,
            AccountEntity? selectedAccount)?
        failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<AccountEntity> accounts, AccountEntity? selectedAccount)?
        loading,
    TResult Function(
            List<AccountEntity> accounts, AccountEntity selectedAccount)?
        loaded,
    TResult Function(String message, List<AccountEntity> accounts,
            AccountEntity? selectedAccount)?
        failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInitial value) initial,
    required TResult Function(AccountLoading value) loading,
    required TResult Function(AccountsLoaded value) loaded,
    required TResult Function(AccountFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountInitial value)? initial,
    TResult? Function(AccountLoading value)? loading,
    TResult? Function(AccountsLoaded value)? loaded,
    TResult? Function(AccountFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInitial value)? initial,
    TResult Function(AccountLoading value)? loading,
    TResult Function(AccountsLoaded value)? loaded,
    TResult Function(AccountFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AccountInitial extends AccountState {
  const factory AccountInitial() = _$AccountInitialImpl;
  const AccountInitial._() : super._();
}

/// @nodoc
abstract class _$$AccountLoadingImplCopyWith<$Res> {
  factory _$$AccountLoadingImplCopyWith(_$AccountLoadingImpl value,
          $Res Function(_$AccountLoadingImpl) then) =
      __$$AccountLoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<AccountEntity> accounts, AccountEntity? selectedAccount});
}

/// @nodoc
class __$$AccountLoadingImplCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$AccountLoadingImpl>
    implements _$$AccountLoadingImplCopyWith<$Res> {
  __$$AccountLoadingImplCopyWithImpl(
      _$AccountLoadingImpl _value, $Res Function(_$AccountLoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accounts = null,
    Object? selectedAccount = freezed,
  }) {
    return _then(_$AccountLoadingImpl(
      accounts: null == accounts
          ? _value._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<AccountEntity>,
      selectedAccount: freezed == selectedAccount
          ? _value.selectedAccount
          : selectedAccount // ignore: cast_nullable_to_non_nullable
              as AccountEntity?,
    ));
  }
}

/// @nodoc

class _$AccountLoadingImpl extends AccountLoading {
  const _$AccountLoadingImpl(
      {final List<AccountEntity> accounts = const [], this.selectedAccount})
      : _accounts = accounts,
        super._();

  final List<AccountEntity> _accounts;
  @override
  @JsonKey()
  List<AccountEntity> get accounts {
    if (_accounts is EqualUnmodifiableListView) return _accounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accounts);
  }

  @override
  final AccountEntity? selectedAccount;

  @override
  String toString() {
    return 'AccountState.loading(accounts: $accounts, selectedAccount: $selectedAccount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountLoadingImpl &&
            const DeepCollectionEquality().equals(other._accounts, _accounts) &&
            (identical(other.selectedAccount, selectedAccount) ||
                other.selectedAccount == selectedAccount));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_accounts), selectedAccount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountLoadingImplCopyWith<_$AccountLoadingImpl> get copyWith =>
      __$$AccountLoadingImplCopyWithImpl<_$AccountLoadingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<AccountEntity> accounts, AccountEntity? selectedAccount)
        loading,
    required TResult Function(
            List<AccountEntity> accounts, AccountEntity selectedAccount)
        loaded,
    required TResult Function(String message, List<AccountEntity> accounts,
            AccountEntity? selectedAccount)
        failure,
  }) {
    return loading(accounts, selectedAccount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<AccountEntity> accounts, AccountEntity? selectedAccount)?
        loading,
    TResult? Function(
            List<AccountEntity> accounts, AccountEntity selectedAccount)?
        loaded,
    TResult? Function(String message, List<AccountEntity> accounts,
            AccountEntity? selectedAccount)?
        failure,
  }) {
    return loading?.call(accounts, selectedAccount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<AccountEntity> accounts, AccountEntity? selectedAccount)?
        loading,
    TResult Function(
            List<AccountEntity> accounts, AccountEntity selectedAccount)?
        loaded,
    TResult Function(String message, List<AccountEntity> accounts,
            AccountEntity? selectedAccount)?
        failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(accounts, selectedAccount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInitial value) initial,
    required TResult Function(AccountLoading value) loading,
    required TResult Function(AccountsLoaded value) loaded,
    required TResult Function(AccountFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountInitial value)? initial,
    TResult? Function(AccountLoading value)? loading,
    TResult? Function(AccountsLoaded value)? loaded,
    TResult? Function(AccountFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInitial value)? initial,
    TResult Function(AccountLoading value)? loading,
    TResult Function(AccountsLoaded value)? loaded,
    TResult Function(AccountFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AccountLoading extends AccountState {
  const factory AccountLoading(
      {final List<AccountEntity> accounts,
      final AccountEntity? selectedAccount}) = _$AccountLoadingImpl;
  const AccountLoading._() : super._();

  List<AccountEntity> get accounts;
  AccountEntity? get selectedAccount;
  @JsonKey(ignore: true)
  _$$AccountLoadingImplCopyWith<_$AccountLoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccountsLoadedImplCopyWith<$Res> {
  factory _$$AccountsLoadedImplCopyWith(_$AccountsLoadedImpl value,
          $Res Function(_$AccountsLoadedImpl) then) =
      __$$AccountsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<AccountEntity> accounts, AccountEntity selectedAccount});
}

/// @nodoc
class __$$AccountsLoadedImplCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$AccountsLoadedImpl>
    implements _$$AccountsLoadedImplCopyWith<$Res> {
  __$$AccountsLoadedImplCopyWithImpl(
      _$AccountsLoadedImpl _value, $Res Function(_$AccountsLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accounts = null,
    Object? selectedAccount = null,
  }) {
    return _then(_$AccountsLoadedImpl(
      accounts: null == accounts
          ? _value._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<AccountEntity>,
      selectedAccount: null == selectedAccount
          ? _value.selectedAccount
          : selectedAccount // ignore: cast_nullable_to_non_nullable
              as AccountEntity,
    ));
  }
}

/// @nodoc

class _$AccountsLoadedImpl extends AccountsLoaded {
  const _$AccountsLoadedImpl(
      {required final List<AccountEntity> accounts,
      required this.selectedAccount})
      : _accounts = accounts,
        super._();

  final List<AccountEntity> _accounts;
  @override
  List<AccountEntity> get accounts {
    if (_accounts is EqualUnmodifiableListView) return _accounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accounts);
  }

  @override
  final AccountEntity selectedAccount;

  @override
  String toString() {
    return 'AccountState.loaded(accounts: $accounts, selectedAccount: $selectedAccount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountsLoadedImpl &&
            const DeepCollectionEquality().equals(other._accounts, _accounts) &&
            (identical(other.selectedAccount, selectedAccount) ||
                other.selectedAccount == selectedAccount));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_accounts), selectedAccount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountsLoadedImplCopyWith<_$AccountsLoadedImpl> get copyWith =>
      __$$AccountsLoadedImplCopyWithImpl<_$AccountsLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<AccountEntity> accounts, AccountEntity? selectedAccount)
        loading,
    required TResult Function(
            List<AccountEntity> accounts, AccountEntity selectedAccount)
        loaded,
    required TResult Function(String message, List<AccountEntity> accounts,
            AccountEntity? selectedAccount)
        failure,
  }) {
    return loaded(accounts, selectedAccount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<AccountEntity> accounts, AccountEntity? selectedAccount)?
        loading,
    TResult? Function(
            List<AccountEntity> accounts, AccountEntity selectedAccount)?
        loaded,
    TResult? Function(String message, List<AccountEntity> accounts,
            AccountEntity? selectedAccount)?
        failure,
  }) {
    return loaded?.call(accounts, selectedAccount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<AccountEntity> accounts, AccountEntity? selectedAccount)?
        loading,
    TResult Function(
            List<AccountEntity> accounts, AccountEntity selectedAccount)?
        loaded,
    TResult Function(String message, List<AccountEntity> accounts,
            AccountEntity? selectedAccount)?
        failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(accounts, selectedAccount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInitial value) initial,
    required TResult Function(AccountLoading value) loading,
    required TResult Function(AccountsLoaded value) loaded,
    required TResult Function(AccountFailure value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountInitial value)? initial,
    TResult? Function(AccountLoading value)? loading,
    TResult? Function(AccountsLoaded value)? loaded,
    TResult? Function(AccountFailure value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInitial value)? initial,
    TResult Function(AccountLoading value)? loading,
    TResult Function(AccountsLoaded value)? loaded,
    TResult Function(AccountFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class AccountsLoaded extends AccountState {
  const factory AccountsLoaded(
      {required final List<AccountEntity> accounts,
      required final AccountEntity selectedAccount}) = _$AccountsLoadedImpl;
  const AccountsLoaded._() : super._();

  List<AccountEntity> get accounts;
  AccountEntity get selectedAccount;
  @JsonKey(ignore: true)
  _$$AccountsLoadedImplCopyWith<_$AccountsLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccountFailureImplCopyWith<$Res> {
  factory _$$AccountFailureImplCopyWith(_$AccountFailureImpl value,
          $Res Function(_$AccountFailureImpl) then) =
      __$$AccountFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String message,
      List<AccountEntity> accounts,
      AccountEntity? selectedAccount});
}

/// @nodoc
class __$$AccountFailureImplCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$AccountFailureImpl>
    implements _$$AccountFailureImplCopyWith<$Res> {
  __$$AccountFailureImplCopyWithImpl(
      _$AccountFailureImpl _value, $Res Function(_$AccountFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? accounts = null,
    Object? selectedAccount = freezed,
  }) {
    return _then(_$AccountFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      accounts: null == accounts
          ? _value._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<AccountEntity>,
      selectedAccount: freezed == selectedAccount
          ? _value.selectedAccount
          : selectedAccount // ignore: cast_nullable_to_non_nullable
              as AccountEntity?,
    ));
  }
}

/// @nodoc

class _$AccountFailureImpl extends AccountFailure {
  const _$AccountFailureImpl(
      {required this.message,
      final List<AccountEntity> accounts = const [],
      this.selectedAccount})
      : _accounts = accounts,
        super._();

  @override
  final String message;
  final List<AccountEntity> _accounts;
  @override
  @JsonKey()
  List<AccountEntity> get accounts {
    if (_accounts is EqualUnmodifiableListView) return _accounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accounts);
  }

  @override
  final AccountEntity? selectedAccount;

  @override
  String toString() {
    return 'AccountState.failure(message: $message, accounts: $accounts, selectedAccount: $selectedAccount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._accounts, _accounts) &&
            (identical(other.selectedAccount, selectedAccount) ||
                other.selectedAccount == selectedAccount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message,
      const DeepCollectionEquality().hash(_accounts), selectedAccount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountFailureImplCopyWith<_$AccountFailureImpl> get copyWith =>
      __$$AccountFailureImplCopyWithImpl<_$AccountFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<AccountEntity> accounts, AccountEntity? selectedAccount)
        loading,
    required TResult Function(
            List<AccountEntity> accounts, AccountEntity selectedAccount)
        loaded,
    required TResult Function(String message, List<AccountEntity> accounts,
            AccountEntity? selectedAccount)
        failure,
  }) {
    return failure(message, accounts, selectedAccount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<AccountEntity> accounts, AccountEntity? selectedAccount)?
        loading,
    TResult? Function(
            List<AccountEntity> accounts, AccountEntity selectedAccount)?
        loaded,
    TResult? Function(String message, List<AccountEntity> accounts,
            AccountEntity? selectedAccount)?
        failure,
  }) {
    return failure?.call(message, accounts, selectedAccount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<AccountEntity> accounts, AccountEntity? selectedAccount)?
        loading,
    TResult Function(
            List<AccountEntity> accounts, AccountEntity selectedAccount)?
        loaded,
    TResult Function(String message, List<AccountEntity> accounts,
            AccountEntity? selectedAccount)?
        failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message, accounts, selectedAccount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInitial value) initial,
    required TResult Function(AccountLoading value) loading,
    required TResult Function(AccountsLoaded value) loaded,
    required TResult Function(AccountFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountInitial value)? initial,
    TResult? Function(AccountLoading value)? loading,
    TResult? Function(AccountsLoaded value)? loaded,
    TResult? Function(AccountFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInitial value)? initial,
    TResult Function(AccountLoading value)? loading,
    TResult Function(AccountsLoaded value)? loaded,
    TResult Function(AccountFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class AccountFailure extends AccountState {
  const factory AccountFailure(
      {required final String message,
      final List<AccountEntity> accounts,
      final AccountEntity? selectedAccount}) = _$AccountFailureImpl;
  const AccountFailure._() : super._();

  String get message;
  List<AccountEntity> get accounts;
  AccountEntity? get selectedAccount;
  @JsonKey(ignore: true)
  _$$AccountFailureImplCopyWith<_$AccountFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
