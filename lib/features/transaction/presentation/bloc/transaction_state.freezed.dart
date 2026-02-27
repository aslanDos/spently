// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransactionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<TransactionEntity> transactions) loading,
    required TResult Function(List<TransactionEntity> transactions) loaded,
    required TResult Function(TransactionOperation operation,
            List<TransactionEntity> transactions)
        success,
    required TResult Function(
            String message, List<TransactionEntity> transactions)
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<TransactionEntity> transactions)? loading,
    TResult? Function(List<TransactionEntity> transactions)? loaded,
    TResult? Function(TransactionOperation operation,
            List<TransactionEntity> transactions)?
        success,
    TResult? Function(String message, List<TransactionEntity> transactions)?
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<TransactionEntity> transactions)? loading,
    TResult Function(List<TransactionEntity> transactions)? loaded,
    TResult Function(TransactionOperation operation,
            List<TransactionEntity> transactions)?
        success,
    TResult Function(String message, List<TransactionEntity> transactions)?
        failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransactionInitial value) initial,
    required TResult Function(TransactionLoading value) loading,
    required TResult Function(TransactionsLoaded value) loaded,
    required TResult Function(TransactionSuccess value) success,
    required TResult Function(TransactionFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionInitial value)? initial,
    TResult? Function(TransactionLoading value)? loading,
    TResult? Function(TransactionsLoaded value)? loaded,
    TResult? Function(TransactionSuccess value)? success,
    TResult? Function(TransactionFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionInitial value)? initial,
    TResult Function(TransactionLoading value)? loading,
    TResult Function(TransactionsLoaded value)? loaded,
    TResult Function(TransactionSuccess value)? success,
    TResult Function(TransactionFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionStateCopyWith<$Res> {
  factory $TransactionStateCopyWith(
          TransactionState value, $Res Function(TransactionState) then) =
      _$TransactionStateCopyWithImpl<$Res, TransactionState>;
}

/// @nodoc
class _$TransactionStateCopyWithImpl<$Res, $Val extends TransactionState>
    implements $TransactionStateCopyWith<$Res> {
  _$TransactionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$TransactionInitialImplCopyWith<$Res> {
  factory _$$TransactionInitialImplCopyWith(_$TransactionInitialImpl value,
          $Res Function(_$TransactionInitialImpl) then) =
      __$$TransactionInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransactionInitialImplCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$TransactionInitialImpl>
    implements _$$TransactionInitialImplCopyWith<$Res> {
  __$$TransactionInitialImplCopyWithImpl(_$TransactionInitialImpl _value,
      $Res Function(_$TransactionInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TransactionInitialImpl extends TransactionInitial {
  const _$TransactionInitialImpl() : super._();

  @override
  String toString() {
    return 'TransactionState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TransactionInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<TransactionEntity> transactions) loading,
    required TResult Function(List<TransactionEntity> transactions) loaded,
    required TResult Function(TransactionOperation operation,
            List<TransactionEntity> transactions)
        success,
    required TResult Function(
            String message, List<TransactionEntity> transactions)
        failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<TransactionEntity> transactions)? loading,
    TResult? Function(List<TransactionEntity> transactions)? loaded,
    TResult? Function(TransactionOperation operation,
            List<TransactionEntity> transactions)?
        success,
    TResult? Function(String message, List<TransactionEntity> transactions)?
        failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<TransactionEntity> transactions)? loading,
    TResult Function(List<TransactionEntity> transactions)? loaded,
    TResult Function(TransactionOperation operation,
            List<TransactionEntity> transactions)?
        success,
    TResult Function(String message, List<TransactionEntity> transactions)?
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
    required TResult Function(TransactionInitial value) initial,
    required TResult Function(TransactionLoading value) loading,
    required TResult Function(TransactionsLoaded value) loaded,
    required TResult Function(TransactionSuccess value) success,
    required TResult Function(TransactionFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionInitial value)? initial,
    TResult? Function(TransactionLoading value)? loading,
    TResult? Function(TransactionsLoaded value)? loaded,
    TResult? Function(TransactionSuccess value)? success,
    TResult? Function(TransactionFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionInitial value)? initial,
    TResult Function(TransactionLoading value)? loading,
    TResult Function(TransactionsLoaded value)? loaded,
    TResult Function(TransactionSuccess value)? success,
    TResult Function(TransactionFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TransactionInitial extends TransactionState {
  const factory TransactionInitial() = _$TransactionInitialImpl;
  const TransactionInitial._() : super._();
}

/// @nodoc
abstract class _$$TransactionLoadingImplCopyWith<$Res> {
  factory _$$TransactionLoadingImplCopyWith(_$TransactionLoadingImpl value,
          $Res Function(_$TransactionLoadingImpl) then) =
      __$$TransactionLoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TransactionEntity> transactions});
}

/// @nodoc
class __$$TransactionLoadingImplCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$TransactionLoadingImpl>
    implements _$$TransactionLoadingImplCopyWith<$Res> {
  __$$TransactionLoadingImplCopyWithImpl(_$TransactionLoadingImpl _value,
      $Res Function(_$TransactionLoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
  }) {
    return _then(_$TransactionLoadingImpl(
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TransactionEntity>,
    ));
  }
}

/// @nodoc

class _$TransactionLoadingImpl extends TransactionLoading {
  const _$TransactionLoadingImpl(
      {final List<TransactionEntity> transactions = const []})
      : _transactions = transactions,
        super._();

  final List<TransactionEntity> _transactions;
  @override
  @JsonKey()
  List<TransactionEntity> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  String toString() {
    return 'TransactionState.loading(transactions: $transactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionLoadingImpl &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_transactions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionLoadingImplCopyWith<_$TransactionLoadingImpl> get copyWith =>
      __$$TransactionLoadingImplCopyWithImpl<_$TransactionLoadingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<TransactionEntity> transactions) loading,
    required TResult Function(List<TransactionEntity> transactions) loaded,
    required TResult Function(TransactionOperation operation,
            List<TransactionEntity> transactions)
        success,
    required TResult Function(
            String message, List<TransactionEntity> transactions)
        failure,
  }) {
    return loading(transactions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<TransactionEntity> transactions)? loading,
    TResult? Function(List<TransactionEntity> transactions)? loaded,
    TResult? Function(TransactionOperation operation,
            List<TransactionEntity> transactions)?
        success,
    TResult? Function(String message, List<TransactionEntity> transactions)?
        failure,
  }) {
    return loading?.call(transactions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<TransactionEntity> transactions)? loading,
    TResult Function(List<TransactionEntity> transactions)? loaded,
    TResult Function(TransactionOperation operation,
            List<TransactionEntity> transactions)?
        success,
    TResult Function(String message, List<TransactionEntity> transactions)?
        failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(transactions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransactionInitial value) initial,
    required TResult Function(TransactionLoading value) loading,
    required TResult Function(TransactionsLoaded value) loaded,
    required TResult Function(TransactionSuccess value) success,
    required TResult Function(TransactionFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionInitial value)? initial,
    TResult? Function(TransactionLoading value)? loading,
    TResult? Function(TransactionsLoaded value)? loaded,
    TResult? Function(TransactionSuccess value)? success,
    TResult? Function(TransactionFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionInitial value)? initial,
    TResult Function(TransactionLoading value)? loading,
    TResult Function(TransactionsLoaded value)? loaded,
    TResult Function(TransactionSuccess value)? success,
    TResult Function(TransactionFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TransactionLoading extends TransactionState {
  const factory TransactionLoading(
      {final List<TransactionEntity> transactions}) = _$TransactionLoadingImpl;
  const TransactionLoading._() : super._();

  List<TransactionEntity> get transactions;
  @JsonKey(ignore: true)
  _$$TransactionLoadingImplCopyWith<_$TransactionLoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransactionsLoadedImplCopyWith<$Res> {
  factory _$$TransactionsLoadedImplCopyWith(_$TransactionsLoadedImpl value,
          $Res Function(_$TransactionsLoadedImpl) then) =
      __$$TransactionsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TransactionEntity> transactions});
}

/// @nodoc
class __$$TransactionsLoadedImplCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$TransactionsLoadedImpl>
    implements _$$TransactionsLoadedImplCopyWith<$Res> {
  __$$TransactionsLoadedImplCopyWithImpl(_$TransactionsLoadedImpl _value,
      $Res Function(_$TransactionsLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
  }) {
    return _then(_$TransactionsLoadedImpl(
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TransactionEntity>,
    ));
  }
}

/// @nodoc

class _$TransactionsLoadedImpl extends TransactionsLoaded {
  const _$TransactionsLoadedImpl(
      {required final List<TransactionEntity> transactions})
      : _transactions = transactions,
        super._();

  final List<TransactionEntity> _transactions;
  @override
  List<TransactionEntity> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  String toString() {
    return 'TransactionState.loaded(transactions: $transactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionsLoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_transactions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionsLoadedImplCopyWith<_$TransactionsLoadedImpl> get copyWith =>
      __$$TransactionsLoadedImplCopyWithImpl<_$TransactionsLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<TransactionEntity> transactions) loading,
    required TResult Function(List<TransactionEntity> transactions) loaded,
    required TResult Function(TransactionOperation operation,
            List<TransactionEntity> transactions)
        success,
    required TResult Function(
            String message, List<TransactionEntity> transactions)
        failure,
  }) {
    return loaded(transactions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<TransactionEntity> transactions)? loading,
    TResult? Function(List<TransactionEntity> transactions)? loaded,
    TResult? Function(TransactionOperation operation,
            List<TransactionEntity> transactions)?
        success,
    TResult? Function(String message, List<TransactionEntity> transactions)?
        failure,
  }) {
    return loaded?.call(transactions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<TransactionEntity> transactions)? loading,
    TResult Function(List<TransactionEntity> transactions)? loaded,
    TResult Function(TransactionOperation operation,
            List<TransactionEntity> transactions)?
        success,
    TResult Function(String message, List<TransactionEntity> transactions)?
        failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(transactions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransactionInitial value) initial,
    required TResult Function(TransactionLoading value) loading,
    required TResult Function(TransactionsLoaded value) loaded,
    required TResult Function(TransactionSuccess value) success,
    required TResult Function(TransactionFailure value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionInitial value)? initial,
    TResult? Function(TransactionLoading value)? loading,
    TResult? Function(TransactionsLoaded value)? loaded,
    TResult? Function(TransactionSuccess value)? success,
    TResult? Function(TransactionFailure value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionInitial value)? initial,
    TResult Function(TransactionLoading value)? loading,
    TResult Function(TransactionsLoaded value)? loaded,
    TResult Function(TransactionSuccess value)? success,
    TResult Function(TransactionFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class TransactionsLoaded extends TransactionState {
  const factory TransactionsLoaded(
          {required final List<TransactionEntity> transactions}) =
      _$TransactionsLoadedImpl;
  const TransactionsLoaded._() : super._();

  List<TransactionEntity> get transactions;
  @JsonKey(ignore: true)
  _$$TransactionsLoadedImplCopyWith<_$TransactionsLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransactionSuccessImplCopyWith<$Res> {
  factory _$$TransactionSuccessImplCopyWith(_$TransactionSuccessImpl value,
          $Res Function(_$TransactionSuccessImpl) then) =
      __$$TransactionSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {TransactionOperation operation, List<TransactionEntity> transactions});
}

/// @nodoc
class __$$TransactionSuccessImplCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$TransactionSuccessImpl>
    implements _$$TransactionSuccessImplCopyWith<$Res> {
  __$$TransactionSuccessImplCopyWithImpl(_$TransactionSuccessImpl _value,
      $Res Function(_$TransactionSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operation = null,
    Object? transactions = null,
  }) {
    return _then(_$TransactionSuccessImpl(
      operation: null == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as TransactionOperation,
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TransactionEntity>,
    ));
  }
}

/// @nodoc

class _$TransactionSuccessImpl extends TransactionSuccess {
  const _$TransactionSuccessImpl(
      {required this.operation,
      required final List<TransactionEntity> transactions})
      : _transactions = transactions,
        super._();

  @override
  final TransactionOperation operation;
  final List<TransactionEntity> _transactions;
  @override
  List<TransactionEntity> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  String toString() {
    return 'TransactionState.success(operation: $operation, transactions: $transactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionSuccessImpl &&
            (identical(other.operation, operation) ||
                other.operation == operation) &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, operation,
      const DeepCollectionEquality().hash(_transactions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionSuccessImplCopyWith<_$TransactionSuccessImpl> get copyWith =>
      __$$TransactionSuccessImplCopyWithImpl<_$TransactionSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<TransactionEntity> transactions) loading,
    required TResult Function(List<TransactionEntity> transactions) loaded,
    required TResult Function(TransactionOperation operation,
            List<TransactionEntity> transactions)
        success,
    required TResult Function(
            String message, List<TransactionEntity> transactions)
        failure,
  }) {
    return success(operation, transactions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<TransactionEntity> transactions)? loading,
    TResult? Function(List<TransactionEntity> transactions)? loaded,
    TResult? Function(TransactionOperation operation,
            List<TransactionEntity> transactions)?
        success,
    TResult? Function(String message, List<TransactionEntity> transactions)?
        failure,
  }) {
    return success?.call(operation, transactions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<TransactionEntity> transactions)? loading,
    TResult Function(List<TransactionEntity> transactions)? loaded,
    TResult Function(TransactionOperation operation,
            List<TransactionEntity> transactions)?
        success,
    TResult Function(String message, List<TransactionEntity> transactions)?
        failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(operation, transactions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransactionInitial value) initial,
    required TResult Function(TransactionLoading value) loading,
    required TResult Function(TransactionsLoaded value) loaded,
    required TResult Function(TransactionSuccess value) success,
    required TResult Function(TransactionFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionInitial value)? initial,
    TResult? Function(TransactionLoading value)? loading,
    TResult? Function(TransactionsLoaded value)? loaded,
    TResult? Function(TransactionSuccess value)? success,
    TResult? Function(TransactionFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionInitial value)? initial,
    TResult Function(TransactionLoading value)? loading,
    TResult Function(TransactionsLoaded value)? loaded,
    TResult Function(TransactionSuccess value)? success,
    TResult Function(TransactionFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class TransactionSuccess extends TransactionState {
  const factory TransactionSuccess(
          {required final TransactionOperation operation,
          required final List<TransactionEntity> transactions}) =
      _$TransactionSuccessImpl;
  const TransactionSuccess._() : super._();

  TransactionOperation get operation;
  List<TransactionEntity> get transactions;
  @JsonKey(ignore: true)
  _$$TransactionSuccessImplCopyWith<_$TransactionSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransactionFailureImplCopyWith<$Res> {
  factory _$$TransactionFailureImplCopyWith(_$TransactionFailureImpl value,
          $Res Function(_$TransactionFailureImpl) then) =
      __$$TransactionFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, List<TransactionEntity> transactions});
}

/// @nodoc
class __$$TransactionFailureImplCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$TransactionFailureImpl>
    implements _$$TransactionFailureImplCopyWith<$Res> {
  __$$TransactionFailureImplCopyWithImpl(_$TransactionFailureImpl _value,
      $Res Function(_$TransactionFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? transactions = null,
  }) {
    return _then(_$TransactionFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TransactionEntity>,
    ));
  }
}

/// @nodoc

class _$TransactionFailureImpl extends TransactionFailure {
  const _$TransactionFailureImpl(
      {required this.message,
      final List<TransactionEntity> transactions = const []})
      : _transactions = transactions,
        super._();

  @override
  final String message;
  final List<TransactionEntity> _transactions;
  @override
  @JsonKey()
  List<TransactionEntity> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  String toString() {
    return 'TransactionState.failure(message: $message, transactions: $transactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_transactions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionFailureImplCopyWith<_$TransactionFailureImpl> get copyWith =>
      __$$TransactionFailureImplCopyWithImpl<_$TransactionFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<TransactionEntity> transactions) loading,
    required TResult Function(List<TransactionEntity> transactions) loaded,
    required TResult Function(TransactionOperation operation,
            List<TransactionEntity> transactions)
        success,
    required TResult Function(
            String message, List<TransactionEntity> transactions)
        failure,
  }) {
    return failure(message, transactions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<TransactionEntity> transactions)? loading,
    TResult? Function(List<TransactionEntity> transactions)? loaded,
    TResult? Function(TransactionOperation operation,
            List<TransactionEntity> transactions)?
        success,
    TResult? Function(String message, List<TransactionEntity> transactions)?
        failure,
  }) {
    return failure?.call(message, transactions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<TransactionEntity> transactions)? loading,
    TResult Function(List<TransactionEntity> transactions)? loaded,
    TResult Function(TransactionOperation operation,
            List<TransactionEntity> transactions)?
        success,
    TResult Function(String message, List<TransactionEntity> transactions)?
        failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message, transactions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransactionInitial value) initial,
    required TResult Function(TransactionLoading value) loading,
    required TResult Function(TransactionsLoaded value) loaded,
    required TResult Function(TransactionSuccess value) success,
    required TResult Function(TransactionFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionInitial value)? initial,
    TResult? Function(TransactionLoading value)? loading,
    TResult? Function(TransactionsLoaded value)? loaded,
    TResult? Function(TransactionSuccess value)? success,
    TResult? Function(TransactionFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionInitial value)? initial,
    TResult Function(TransactionLoading value)? loading,
    TResult Function(TransactionsLoaded value)? loaded,
    TResult Function(TransactionSuccess value)? success,
    TResult Function(TransactionFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class TransactionFailure extends TransactionState {
  const factory TransactionFailure(
      {required final String message,
      final List<TransactionEntity> transactions}) = _$TransactionFailureImpl;
  const TransactionFailure._() : super._();

  String get message;
  List<TransactionEntity> get transactions;
  @JsonKey(ignore: true)
  _$$TransactionFailureImplCopyWith<_$TransactionFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
