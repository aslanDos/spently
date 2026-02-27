// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransactionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TransactionFilter? filter) loadAll,
    required TResult Function(String transactionId) load,
    required TResult Function(TransactionEntity transaction) create,
    required TResult Function(TransactionEntity transaction) update,
    required TResult Function(String transactionId) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TransactionFilter? filter)? loadAll,
    TResult? Function(String transactionId)? load,
    TResult? Function(TransactionEntity transaction)? create,
    TResult? Function(TransactionEntity transaction)? update,
    TResult? Function(String transactionId)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TransactionFilter? filter)? loadAll,
    TResult Function(String transactionId)? load,
    TResult Function(TransactionEntity transaction)? create,
    TResult Function(TransactionEntity transaction)? update,
    TResult Function(String transactionId)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTransactionsEvent value) loadAll,
    required TResult Function(LoadTransactionEvent value) load,
    required TResult Function(CreateTransactionEvent value) create,
    required TResult Function(UpdateTransactionEvent value) update,
    required TResult Function(DeleteTransactionEvent value) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTransactionsEvent value)? loadAll,
    TResult? Function(LoadTransactionEvent value)? load,
    TResult? Function(CreateTransactionEvent value)? create,
    TResult? Function(UpdateTransactionEvent value)? update,
    TResult? Function(DeleteTransactionEvent value)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTransactionsEvent value)? loadAll,
    TResult Function(LoadTransactionEvent value)? load,
    TResult Function(CreateTransactionEvent value)? create,
    TResult Function(UpdateTransactionEvent value)? update,
    TResult Function(DeleteTransactionEvent value)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionEventCopyWith<$Res> {
  factory $TransactionEventCopyWith(
          TransactionEvent value, $Res Function(TransactionEvent) then) =
      _$TransactionEventCopyWithImpl<$Res, TransactionEvent>;
}

/// @nodoc
class _$TransactionEventCopyWithImpl<$Res, $Val extends TransactionEvent>
    implements $TransactionEventCopyWith<$Res> {
  _$TransactionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadTransactionsEventImplCopyWith<$Res> {
  factory _$$LoadTransactionsEventImplCopyWith(
          _$LoadTransactionsEventImpl value,
          $Res Function(_$LoadTransactionsEventImpl) then) =
      __$$LoadTransactionsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TransactionFilter? filter});
}

/// @nodoc
class __$$LoadTransactionsEventImplCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$LoadTransactionsEventImpl>
    implements _$$LoadTransactionsEventImplCopyWith<$Res> {
  __$$LoadTransactionsEventImplCopyWithImpl(_$LoadTransactionsEventImpl _value,
      $Res Function(_$LoadTransactionsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = freezed,
  }) {
    return _then(_$LoadTransactionsEventImpl(
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as TransactionFilter?,
    ));
  }
}

/// @nodoc

class _$LoadTransactionsEventImpl implements LoadTransactionsEvent {
  const _$LoadTransactionsEventImpl({this.filter});

  @override
  final TransactionFilter? filter;

  @override
  String toString() {
    return 'TransactionEvent.loadAll(filter: $filter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadTransactionsEventImpl &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadTransactionsEventImplCopyWith<_$LoadTransactionsEventImpl>
      get copyWith => __$$LoadTransactionsEventImplCopyWithImpl<
          _$LoadTransactionsEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TransactionFilter? filter) loadAll,
    required TResult Function(String transactionId) load,
    required TResult Function(TransactionEntity transaction) create,
    required TResult Function(TransactionEntity transaction) update,
    required TResult Function(String transactionId) delete,
  }) {
    return loadAll(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TransactionFilter? filter)? loadAll,
    TResult? Function(String transactionId)? load,
    TResult? Function(TransactionEntity transaction)? create,
    TResult? Function(TransactionEntity transaction)? update,
    TResult? Function(String transactionId)? delete,
  }) {
    return loadAll?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TransactionFilter? filter)? loadAll,
    TResult Function(String transactionId)? load,
    TResult Function(TransactionEntity transaction)? create,
    TResult Function(TransactionEntity transaction)? update,
    TResult Function(String transactionId)? delete,
    required TResult orElse(),
  }) {
    if (loadAll != null) {
      return loadAll(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTransactionsEvent value) loadAll,
    required TResult Function(LoadTransactionEvent value) load,
    required TResult Function(CreateTransactionEvent value) create,
    required TResult Function(UpdateTransactionEvent value) update,
    required TResult Function(DeleteTransactionEvent value) delete,
  }) {
    return loadAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTransactionsEvent value)? loadAll,
    TResult? Function(LoadTransactionEvent value)? load,
    TResult? Function(CreateTransactionEvent value)? create,
    TResult? Function(UpdateTransactionEvent value)? update,
    TResult? Function(DeleteTransactionEvent value)? delete,
  }) {
    return loadAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTransactionsEvent value)? loadAll,
    TResult Function(LoadTransactionEvent value)? load,
    TResult Function(CreateTransactionEvent value)? create,
    TResult Function(UpdateTransactionEvent value)? update,
    TResult Function(DeleteTransactionEvent value)? delete,
    required TResult orElse(),
  }) {
    if (loadAll != null) {
      return loadAll(this);
    }
    return orElse();
  }
}

abstract class LoadTransactionsEvent implements TransactionEvent {
  const factory LoadTransactionsEvent({final TransactionFilter? filter}) =
      _$LoadTransactionsEventImpl;

  TransactionFilter? get filter;
  @JsonKey(ignore: true)
  _$$LoadTransactionsEventImplCopyWith<_$LoadTransactionsEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadTransactionEventImplCopyWith<$Res> {
  factory _$$LoadTransactionEventImplCopyWith(_$LoadTransactionEventImpl value,
          $Res Function(_$LoadTransactionEventImpl) then) =
      __$$LoadTransactionEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String transactionId});
}

/// @nodoc
class __$$LoadTransactionEventImplCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$LoadTransactionEventImpl>
    implements _$$LoadTransactionEventImplCopyWith<$Res> {
  __$$LoadTransactionEventImplCopyWithImpl(_$LoadTransactionEventImpl _value,
      $Res Function(_$LoadTransactionEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
  }) {
    return _then(_$LoadTransactionEventImpl(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadTransactionEventImpl implements LoadTransactionEvent {
  const _$LoadTransactionEventImpl({required this.transactionId});

  @override
  final String transactionId;

  @override
  String toString() {
    return 'TransactionEvent.load(transactionId: $transactionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadTransactionEventImpl &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transactionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadTransactionEventImplCopyWith<_$LoadTransactionEventImpl>
      get copyWith =>
          __$$LoadTransactionEventImplCopyWithImpl<_$LoadTransactionEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TransactionFilter? filter) loadAll,
    required TResult Function(String transactionId) load,
    required TResult Function(TransactionEntity transaction) create,
    required TResult Function(TransactionEntity transaction) update,
    required TResult Function(String transactionId) delete,
  }) {
    return load(transactionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TransactionFilter? filter)? loadAll,
    TResult? Function(String transactionId)? load,
    TResult? Function(TransactionEntity transaction)? create,
    TResult? Function(TransactionEntity transaction)? update,
    TResult? Function(String transactionId)? delete,
  }) {
    return load?.call(transactionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TransactionFilter? filter)? loadAll,
    TResult Function(String transactionId)? load,
    TResult Function(TransactionEntity transaction)? create,
    TResult Function(TransactionEntity transaction)? update,
    TResult Function(String transactionId)? delete,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(transactionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTransactionsEvent value) loadAll,
    required TResult Function(LoadTransactionEvent value) load,
    required TResult Function(CreateTransactionEvent value) create,
    required TResult Function(UpdateTransactionEvent value) update,
    required TResult Function(DeleteTransactionEvent value) delete,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTransactionsEvent value)? loadAll,
    TResult? Function(LoadTransactionEvent value)? load,
    TResult? Function(CreateTransactionEvent value)? create,
    TResult? Function(UpdateTransactionEvent value)? update,
    TResult? Function(DeleteTransactionEvent value)? delete,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTransactionsEvent value)? loadAll,
    TResult Function(LoadTransactionEvent value)? load,
    TResult Function(CreateTransactionEvent value)? create,
    TResult Function(UpdateTransactionEvent value)? update,
    TResult Function(DeleteTransactionEvent value)? delete,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class LoadTransactionEvent implements TransactionEvent {
  const factory LoadTransactionEvent({required final String transactionId}) =
      _$LoadTransactionEventImpl;

  String get transactionId;
  @JsonKey(ignore: true)
  _$$LoadTransactionEventImplCopyWith<_$LoadTransactionEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateTransactionEventImplCopyWith<$Res> {
  factory _$$CreateTransactionEventImplCopyWith(
          _$CreateTransactionEventImpl value,
          $Res Function(_$CreateTransactionEventImpl) then) =
      __$$CreateTransactionEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TransactionEntity transaction});
}

/// @nodoc
class __$$CreateTransactionEventImplCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$CreateTransactionEventImpl>
    implements _$$CreateTransactionEventImplCopyWith<$Res> {
  __$$CreateTransactionEventImplCopyWithImpl(
      _$CreateTransactionEventImpl _value,
      $Res Function(_$CreateTransactionEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = null,
  }) {
    return _then(_$CreateTransactionEventImpl(
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as TransactionEntity,
    ));
  }
}

/// @nodoc

class _$CreateTransactionEventImpl implements CreateTransactionEvent {
  const _$CreateTransactionEventImpl({required this.transaction});

  @override
  final TransactionEntity transaction;

  @override
  String toString() {
    return 'TransactionEvent.create(transaction: $transaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTransactionEventImpl &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transaction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTransactionEventImplCopyWith<_$CreateTransactionEventImpl>
      get copyWith => __$$CreateTransactionEventImplCopyWithImpl<
          _$CreateTransactionEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TransactionFilter? filter) loadAll,
    required TResult Function(String transactionId) load,
    required TResult Function(TransactionEntity transaction) create,
    required TResult Function(TransactionEntity transaction) update,
    required TResult Function(String transactionId) delete,
  }) {
    return create(transaction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TransactionFilter? filter)? loadAll,
    TResult? Function(String transactionId)? load,
    TResult? Function(TransactionEntity transaction)? create,
    TResult? Function(TransactionEntity transaction)? update,
    TResult? Function(String transactionId)? delete,
  }) {
    return create?.call(transaction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TransactionFilter? filter)? loadAll,
    TResult Function(String transactionId)? load,
    TResult Function(TransactionEntity transaction)? create,
    TResult Function(TransactionEntity transaction)? update,
    TResult Function(String transactionId)? delete,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(transaction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTransactionsEvent value) loadAll,
    required TResult Function(LoadTransactionEvent value) load,
    required TResult Function(CreateTransactionEvent value) create,
    required TResult Function(UpdateTransactionEvent value) update,
    required TResult Function(DeleteTransactionEvent value) delete,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTransactionsEvent value)? loadAll,
    TResult? Function(LoadTransactionEvent value)? load,
    TResult? Function(CreateTransactionEvent value)? create,
    TResult? Function(UpdateTransactionEvent value)? update,
    TResult? Function(DeleteTransactionEvent value)? delete,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTransactionsEvent value)? loadAll,
    TResult Function(LoadTransactionEvent value)? load,
    TResult Function(CreateTransactionEvent value)? create,
    TResult Function(UpdateTransactionEvent value)? update,
    TResult Function(DeleteTransactionEvent value)? delete,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class CreateTransactionEvent implements TransactionEvent {
  const factory CreateTransactionEvent(
          {required final TransactionEntity transaction}) =
      _$CreateTransactionEventImpl;

  TransactionEntity get transaction;
  @JsonKey(ignore: true)
  _$$CreateTransactionEventImplCopyWith<_$CreateTransactionEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateTransactionEventImplCopyWith<$Res> {
  factory _$$UpdateTransactionEventImplCopyWith(
          _$UpdateTransactionEventImpl value,
          $Res Function(_$UpdateTransactionEventImpl) then) =
      __$$UpdateTransactionEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TransactionEntity transaction});
}

/// @nodoc
class __$$UpdateTransactionEventImplCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$UpdateTransactionEventImpl>
    implements _$$UpdateTransactionEventImplCopyWith<$Res> {
  __$$UpdateTransactionEventImplCopyWithImpl(
      _$UpdateTransactionEventImpl _value,
      $Res Function(_$UpdateTransactionEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = null,
  }) {
    return _then(_$UpdateTransactionEventImpl(
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as TransactionEntity,
    ));
  }
}

/// @nodoc

class _$UpdateTransactionEventImpl implements UpdateTransactionEvent {
  const _$UpdateTransactionEventImpl({required this.transaction});

  @override
  final TransactionEntity transaction;

  @override
  String toString() {
    return 'TransactionEvent.update(transaction: $transaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTransactionEventImpl &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transaction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTransactionEventImplCopyWith<_$UpdateTransactionEventImpl>
      get copyWith => __$$UpdateTransactionEventImplCopyWithImpl<
          _$UpdateTransactionEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TransactionFilter? filter) loadAll,
    required TResult Function(String transactionId) load,
    required TResult Function(TransactionEntity transaction) create,
    required TResult Function(TransactionEntity transaction) update,
    required TResult Function(String transactionId) delete,
  }) {
    return update(transaction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TransactionFilter? filter)? loadAll,
    TResult? Function(String transactionId)? load,
    TResult? Function(TransactionEntity transaction)? create,
    TResult? Function(TransactionEntity transaction)? update,
    TResult? Function(String transactionId)? delete,
  }) {
    return update?.call(transaction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TransactionFilter? filter)? loadAll,
    TResult Function(String transactionId)? load,
    TResult Function(TransactionEntity transaction)? create,
    TResult Function(TransactionEntity transaction)? update,
    TResult Function(String transactionId)? delete,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(transaction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTransactionsEvent value) loadAll,
    required TResult Function(LoadTransactionEvent value) load,
    required TResult Function(CreateTransactionEvent value) create,
    required TResult Function(UpdateTransactionEvent value) update,
    required TResult Function(DeleteTransactionEvent value) delete,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTransactionsEvent value)? loadAll,
    TResult? Function(LoadTransactionEvent value)? load,
    TResult? Function(CreateTransactionEvent value)? create,
    TResult? Function(UpdateTransactionEvent value)? update,
    TResult? Function(DeleteTransactionEvent value)? delete,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTransactionsEvent value)? loadAll,
    TResult Function(LoadTransactionEvent value)? load,
    TResult Function(CreateTransactionEvent value)? create,
    TResult Function(UpdateTransactionEvent value)? update,
    TResult Function(DeleteTransactionEvent value)? delete,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class UpdateTransactionEvent implements TransactionEvent {
  const factory UpdateTransactionEvent(
          {required final TransactionEntity transaction}) =
      _$UpdateTransactionEventImpl;

  TransactionEntity get transaction;
  @JsonKey(ignore: true)
  _$$UpdateTransactionEventImplCopyWith<_$UpdateTransactionEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteTransactionEventImplCopyWith<$Res> {
  factory _$$DeleteTransactionEventImplCopyWith(
          _$DeleteTransactionEventImpl value,
          $Res Function(_$DeleteTransactionEventImpl) then) =
      __$$DeleteTransactionEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String transactionId});
}

/// @nodoc
class __$$DeleteTransactionEventImplCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$DeleteTransactionEventImpl>
    implements _$$DeleteTransactionEventImplCopyWith<$Res> {
  __$$DeleteTransactionEventImplCopyWithImpl(
      _$DeleteTransactionEventImpl _value,
      $Res Function(_$DeleteTransactionEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
  }) {
    return _then(_$DeleteTransactionEventImpl(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteTransactionEventImpl implements DeleteTransactionEvent {
  const _$DeleteTransactionEventImpl({required this.transactionId});

  @override
  final String transactionId;

  @override
  String toString() {
    return 'TransactionEvent.delete(transactionId: $transactionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteTransactionEventImpl &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transactionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteTransactionEventImplCopyWith<_$DeleteTransactionEventImpl>
      get copyWith => __$$DeleteTransactionEventImplCopyWithImpl<
          _$DeleteTransactionEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TransactionFilter? filter) loadAll,
    required TResult Function(String transactionId) load,
    required TResult Function(TransactionEntity transaction) create,
    required TResult Function(TransactionEntity transaction) update,
    required TResult Function(String transactionId) delete,
  }) {
    return delete(transactionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TransactionFilter? filter)? loadAll,
    TResult? Function(String transactionId)? load,
    TResult? Function(TransactionEntity transaction)? create,
    TResult? Function(TransactionEntity transaction)? update,
    TResult? Function(String transactionId)? delete,
  }) {
    return delete?.call(transactionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TransactionFilter? filter)? loadAll,
    TResult Function(String transactionId)? load,
    TResult Function(TransactionEntity transaction)? create,
    TResult Function(TransactionEntity transaction)? update,
    TResult Function(String transactionId)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(transactionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTransactionsEvent value) loadAll,
    required TResult Function(LoadTransactionEvent value) load,
    required TResult Function(CreateTransactionEvent value) create,
    required TResult Function(UpdateTransactionEvent value) update,
    required TResult Function(DeleteTransactionEvent value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTransactionsEvent value)? loadAll,
    TResult? Function(LoadTransactionEvent value)? load,
    TResult? Function(CreateTransactionEvent value)? create,
    TResult? Function(UpdateTransactionEvent value)? update,
    TResult? Function(DeleteTransactionEvent value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTransactionsEvent value)? loadAll,
    TResult Function(LoadTransactionEvent value)? load,
    TResult Function(CreateTransactionEvent value)? create,
    TResult Function(UpdateTransactionEvent value)? update,
    TResult Function(DeleteTransactionEvent value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class DeleteTransactionEvent implements TransactionEvent {
  const factory DeleteTransactionEvent({required final String transactionId}) =
      _$DeleteTransactionEventImpl;

  String get transactionId;
  @JsonKey(ignore: true)
  _$$DeleteTransactionEventImplCopyWith<_$DeleteTransactionEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}
