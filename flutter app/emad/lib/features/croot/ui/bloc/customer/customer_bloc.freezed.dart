// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String name, String phone) create,
    required TResult Function(bool status) created,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String name, String phone)? create,
    TResult? Function(bool status)? created,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String name, String phone)? create,
    TResult Function(bool status)? created,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(CreateCustomerEvent value) create,
    required TResult Function(CreateCustomerEventEnded value) created,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(CreateCustomerEvent value)? create,
    TResult? Function(CreateCustomerEventEnded value)? created,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(CreateCustomerEvent value)? create,
    TResult Function(CreateCustomerEventEnded value)? created,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerEventCopyWith<$Res> {
  factory $CustomerEventCopyWith(
          CustomerEvent value, $Res Function(CustomerEvent) then) =
      _$CustomerEventCopyWithImpl<$Res, CustomerEvent>;
}

/// @nodoc
class _$CustomerEventCopyWithImpl<$Res, $Val extends CustomerEvent>
    implements $CustomerEventCopyWith<$Res> {
  _$CustomerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$CustomerEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'CustomerEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String name, String phone) create,
    required TResult Function(bool status) created,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String name, String phone)? create,
    TResult? Function(bool status)? created,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String name, String phone)? create,
    TResult Function(bool status)? created,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(CreateCustomerEvent value) create,
    required TResult Function(CreateCustomerEventEnded value) created,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(CreateCustomerEvent value)? create,
    TResult? Function(CreateCustomerEventEnded value)? created,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(CreateCustomerEvent value)? create,
    TResult Function(CreateCustomerEventEnded value)? created,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class Started implements CustomerEvent {
  const factory Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$CreateCustomerEventImplCopyWith<$Res> {
  factory _$$CreateCustomerEventImplCopyWith(_$CreateCustomerEventImpl value,
          $Res Function(_$CreateCustomerEventImpl) then) =
      __$$CreateCustomerEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name, String phone});
}

/// @nodoc
class __$$CreateCustomerEventImplCopyWithImpl<$Res>
    extends _$CustomerEventCopyWithImpl<$Res, _$CreateCustomerEventImpl>
    implements _$$CreateCustomerEventImplCopyWith<$Res> {
  __$$CreateCustomerEventImplCopyWithImpl(_$CreateCustomerEventImpl _value,
      $Res Function(_$CreateCustomerEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
  }) {
    return _then(_$CreateCustomerEventImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateCustomerEventImpl implements CreateCustomerEvent {
  const _$CreateCustomerEventImpl({required this.name, required this.phone});

  @override
  final String name;
  @override
  final String phone;

  @override
  String toString() {
    return 'CustomerEvent.create(name: $name, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateCustomerEventImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateCustomerEventImplCopyWith<_$CreateCustomerEventImpl> get copyWith =>
      __$$CreateCustomerEventImplCopyWithImpl<_$CreateCustomerEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String name, String phone) create,
    required TResult Function(bool status) created,
  }) {
    return create(name, phone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String name, String phone)? create,
    TResult? Function(bool status)? created,
  }) {
    return create?.call(name, phone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String name, String phone)? create,
    TResult Function(bool status)? created,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(name, phone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(CreateCustomerEvent value) create,
    required TResult Function(CreateCustomerEventEnded value) created,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(CreateCustomerEvent value)? create,
    TResult? Function(CreateCustomerEventEnded value)? created,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(CreateCustomerEvent value)? create,
    TResult Function(CreateCustomerEventEnded value)? created,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class CreateCustomerEvent implements CustomerEvent {
  const factory CreateCustomerEvent(
      {required final String name,
      required final String phone}) = _$CreateCustomerEventImpl;

  String get name;
  String get phone;
  @JsonKey(ignore: true)
  _$$CreateCustomerEventImplCopyWith<_$CreateCustomerEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateCustomerEventEndedImplCopyWith<$Res> {
  factory _$$CreateCustomerEventEndedImplCopyWith(
          _$CreateCustomerEventEndedImpl value,
          $Res Function(_$CreateCustomerEventEndedImpl) then) =
      __$$CreateCustomerEventEndedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool status});
}

/// @nodoc
class __$$CreateCustomerEventEndedImplCopyWithImpl<$Res>
    extends _$CustomerEventCopyWithImpl<$Res, _$CreateCustomerEventEndedImpl>
    implements _$$CreateCustomerEventEndedImplCopyWith<$Res> {
  __$$CreateCustomerEventEndedImplCopyWithImpl(
      _$CreateCustomerEventEndedImpl _value,
      $Res Function(_$CreateCustomerEventEndedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$CreateCustomerEventEndedImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CreateCustomerEventEndedImpl implements CreateCustomerEventEnded {
  const _$CreateCustomerEventEndedImpl({required this.status});

  @override
  final bool status;

  @override
  String toString() {
    return 'CustomerEvent.created(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateCustomerEventEndedImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateCustomerEventEndedImplCopyWith<_$CreateCustomerEventEndedImpl>
      get copyWith => __$$CreateCustomerEventEndedImplCopyWithImpl<
          _$CreateCustomerEventEndedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String name, String phone) create,
    required TResult Function(bool status) created,
  }) {
    return created(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String name, String phone)? create,
    TResult? Function(bool status)? created,
  }) {
    return created?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String name, String phone)? create,
    TResult Function(bool status)? created,
    required TResult orElse(),
  }) {
    if (created != null) {
      return created(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(CreateCustomerEvent value) create,
    required TResult Function(CreateCustomerEventEnded value) created,
  }) {
    return created(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(CreateCustomerEvent value)? create,
    TResult? Function(CreateCustomerEventEnded value)? created,
  }) {
    return created?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(CreateCustomerEvent value)? create,
    TResult Function(CreateCustomerEventEnded value)? created,
    required TResult orElse(),
  }) {
    if (created != null) {
      return created(this);
    }
    return orElse();
  }
}

abstract class CreateCustomerEventEnded implements CustomerEvent {
  const factory CreateCustomerEventEnded({required final bool status}) =
      _$CreateCustomerEventEndedImpl;

  bool get status;
  @JsonKey(ignore: true)
  _$$CreateCustomerEventEndedImplCopyWith<_$CreateCustomerEventEndedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CustomerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() endLoading,
    required TResult Function() created,
    required TResult Function(List<Customer> data) data,
    required TResult Function() createFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? endLoading,
    TResult? Function()? created,
    TResult? Function(List<Customer> data)? data,
    TResult? Function()? createFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? endLoading,
    TResult Function()? created,
    TResult Function(List<Customer> data)? data,
    TResult Function()? createFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(EndLoading value) endLoading,
    required TResult Function(Created value) created,
    required TResult Function(Data value) data,
    required TResult Function(CreateFailure value) createFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(EndLoading value)? endLoading,
    TResult? Function(Created value)? created,
    TResult? Function(Data value)? data,
    TResult? Function(CreateFailure value)? createFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(EndLoading value)? endLoading,
    TResult Function(Created value)? created,
    TResult Function(Data value)? data,
    TResult Function(CreateFailure value)? createFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerStateCopyWith<$Res> {
  factory $CustomerStateCopyWith(
          CustomerState value, $Res Function(CustomerState) then) =
      _$CustomerStateCopyWithImpl<$Res, CustomerState>;
}

/// @nodoc
class _$CustomerStateCopyWithImpl<$Res, $Val extends CustomerState>
    implements $CustomerStateCopyWith<$Res> {
  _$CustomerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CustomerStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'CustomerState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() endLoading,
    required TResult Function() created,
    required TResult Function(List<Customer> data) data,
    required TResult Function() createFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? endLoading,
    TResult? Function()? created,
    TResult? Function(List<Customer> data)? data,
    TResult? Function()? createFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? endLoading,
    TResult Function()? created,
    TResult Function(List<Customer> data)? data,
    TResult Function()? createFailure,
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
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(EndLoading value) endLoading,
    required TResult Function(Created value) created,
    required TResult Function(Data value) data,
    required TResult Function(CreateFailure value) createFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(EndLoading value)? endLoading,
    TResult? Function(Created value)? created,
    TResult? Function(Data value)? data,
    TResult? Function(CreateFailure value)? createFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(EndLoading value)? endLoading,
    TResult Function(Created value)? created,
    TResult Function(Data value)? data,
    TResult Function(CreateFailure value)? createFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements CustomerState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$CustomerStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'CustomerState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() endLoading,
    required TResult Function() created,
    required TResult Function(List<Customer> data) data,
    required TResult Function() createFailure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? endLoading,
    TResult? Function()? created,
    TResult? Function(List<Customer> data)? data,
    TResult? Function()? createFailure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? endLoading,
    TResult Function()? created,
    TResult Function(List<Customer> data)? data,
    TResult Function()? createFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(EndLoading value) endLoading,
    required TResult Function(Created value) created,
    required TResult Function(Data value) data,
    required TResult Function(CreateFailure value) createFailure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(EndLoading value)? endLoading,
    TResult? Function(Created value)? created,
    TResult? Function(Data value)? data,
    TResult? Function(CreateFailure value)? createFailure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(EndLoading value)? endLoading,
    TResult Function(Created value)? created,
    TResult Function(Data value)? data,
    TResult Function(CreateFailure value)? createFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements CustomerState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$EndLoadingImplCopyWith<$Res> {
  factory _$$EndLoadingImplCopyWith(
          _$EndLoadingImpl value, $Res Function(_$EndLoadingImpl) then) =
      __$$EndLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EndLoadingImplCopyWithImpl<$Res>
    extends _$CustomerStateCopyWithImpl<$Res, _$EndLoadingImpl>
    implements _$$EndLoadingImplCopyWith<$Res> {
  __$$EndLoadingImplCopyWithImpl(
      _$EndLoadingImpl _value, $Res Function(_$EndLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EndLoadingImpl implements EndLoading {
  const _$EndLoadingImpl();

  @override
  String toString() {
    return 'CustomerState.endLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EndLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() endLoading,
    required TResult Function() created,
    required TResult Function(List<Customer> data) data,
    required TResult Function() createFailure,
  }) {
    return endLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? endLoading,
    TResult? Function()? created,
    TResult? Function(List<Customer> data)? data,
    TResult? Function()? createFailure,
  }) {
    return endLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? endLoading,
    TResult Function()? created,
    TResult Function(List<Customer> data)? data,
    TResult Function()? createFailure,
    required TResult orElse(),
  }) {
    if (endLoading != null) {
      return endLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(EndLoading value) endLoading,
    required TResult Function(Created value) created,
    required TResult Function(Data value) data,
    required TResult Function(CreateFailure value) createFailure,
  }) {
    return endLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(EndLoading value)? endLoading,
    TResult? Function(Created value)? created,
    TResult? Function(Data value)? data,
    TResult? Function(CreateFailure value)? createFailure,
  }) {
    return endLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(EndLoading value)? endLoading,
    TResult Function(Created value)? created,
    TResult Function(Data value)? data,
    TResult Function(CreateFailure value)? createFailure,
    required TResult orElse(),
  }) {
    if (endLoading != null) {
      return endLoading(this);
    }
    return orElse();
  }
}

abstract class EndLoading implements CustomerState {
  const factory EndLoading() = _$EndLoadingImpl;
}

/// @nodoc
abstract class _$$CreatedImplCopyWith<$Res> {
  factory _$$CreatedImplCopyWith(
          _$CreatedImpl value, $Res Function(_$CreatedImpl) then) =
      __$$CreatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreatedImplCopyWithImpl<$Res>
    extends _$CustomerStateCopyWithImpl<$Res, _$CreatedImpl>
    implements _$$CreatedImplCopyWith<$Res> {
  __$$CreatedImplCopyWithImpl(
      _$CreatedImpl _value, $Res Function(_$CreatedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreatedImpl implements Created {
  const _$CreatedImpl();

  @override
  String toString() {
    return 'CustomerState.created()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() endLoading,
    required TResult Function() created,
    required TResult Function(List<Customer> data) data,
    required TResult Function() createFailure,
  }) {
    return created();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? endLoading,
    TResult? Function()? created,
    TResult? Function(List<Customer> data)? data,
    TResult? Function()? createFailure,
  }) {
    return created?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? endLoading,
    TResult Function()? created,
    TResult Function(List<Customer> data)? data,
    TResult Function()? createFailure,
    required TResult orElse(),
  }) {
    if (created != null) {
      return created();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(EndLoading value) endLoading,
    required TResult Function(Created value) created,
    required TResult Function(Data value) data,
    required TResult Function(CreateFailure value) createFailure,
  }) {
    return created(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(EndLoading value)? endLoading,
    TResult? Function(Created value)? created,
    TResult? Function(Data value)? data,
    TResult? Function(CreateFailure value)? createFailure,
  }) {
    return created?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(EndLoading value)? endLoading,
    TResult Function(Created value)? created,
    TResult Function(Data value)? data,
    TResult Function(CreateFailure value)? createFailure,
    required TResult orElse(),
  }) {
    if (created != null) {
      return created(this);
    }
    return orElse();
  }
}

abstract class Created implements CustomerState {
  const factory Created() = _$CreatedImpl;
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Customer> data});
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$CustomerStateCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$DataImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Customer>,
    ));
  }
}

/// @nodoc

class _$DataImpl implements Data {
  const _$DataImpl({required final List<Customer> data}) : _data = data;

  final List<Customer> _data;
  @override
  List<Customer> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'CustomerState.data(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() endLoading,
    required TResult Function() created,
    required TResult Function(List<Customer> data) data,
    required TResult Function() createFailure,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? endLoading,
    TResult? Function()? created,
    TResult? Function(List<Customer> data)? data,
    TResult? Function()? createFailure,
  }) {
    return data?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? endLoading,
    TResult Function()? created,
    TResult Function(List<Customer> data)? data,
    TResult Function()? createFailure,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this.data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(EndLoading value) endLoading,
    required TResult Function(Created value) created,
    required TResult Function(Data value) data,
    required TResult Function(CreateFailure value) createFailure,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(EndLoading value)? endLoading,
    TResult? Function(Created value)? created,
    TResult? Function(Data value)? data,
    TResult? Function(CreateFailure value)? createFailure,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(EndLoading value)? endLoading,
    TResult Function(Created value)? created,
    TResult Function(Data value)? data,
    TResult Function(CreateFailure value)? createFailure,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class Data implements CustomerState {
  const factory Data({required final List<Customer> data}) = _$DataImpl;

  List<Customer> get data;
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateFailureImplCopyWith<$Res> {
  factory _$$CreateFailureImplCopyWith(
          _$CreateFailureImpl value, $Res Function(_$CreateFailureImpl) then) =
      __$$CreateFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateFailureImplCopyWithImpl<$Res>
    extends _$CustomerStateCopyWithImpl<$Res, _$CreateFailureImpl>
    implements _$$CreateFailureImplCopyWith<$Res> {
  __$$CreateFailureImplCopyWithImpl(
      _$CreateFailureImpl _value, $Res Function(_$CreateFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateFailureImpl implements CreateFailure {
  const _$CreateFailureImpl();

  @override
  String toString() {
    return 'CustomerState.createFailure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreateFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() endLoading,
    required TResult Function() created,
    required TResult Function(List<Customer> data) data,
    required TResult Function() createFailure,
  }) {
    return createFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? endLoading,
    TResult? Function()? created,
    TResult? Function(List<Customer> data)? data,
    TResult? Function()? createFailure,
  }) {
    return createFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? endLoading,
    TResult Function()? created,
    TResult Function(List<Customer> data)? data,
    TResult Function()? createFailure,
    required TResult orElse(),
  }) {
    if (createFailure != null) {
      return createFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(EndLoading value) endLoading,
    required TResult Function(Created value) created,
    required TResult Function(Data value) data,
    required TResult Function(CreateFailure value) createFailure,
  }) {
    return createFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(EndLoading value)? endLoading,
    TResult? Function(Created value)? created,
    TResult? Function(Data value)? data,
    TResult? Function(CreateFailure value)? createFailure,
  }) {
    return createFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(EndLoading value)? endLoading,
    TResult Function(Created value)? created,
    TResult Function(Data value)? data,
    TResult Function(CreateFailure value)? createFailure,
    required TResult orElse(),
  }) {
    if (createFailure != null) {
      return createFailure(this);
    }
    return orElse();
  }
}

abstract class CreateFailure implements CustomerState {
  const factory CreateFailure() = _$CreateFailureImpl;
}
