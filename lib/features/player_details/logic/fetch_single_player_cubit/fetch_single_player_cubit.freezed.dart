// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fetch_single_player_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FetchSinglePlayerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetchLoading,
    required TResult Function(PlayerModel player) fetchSuccess,
    required TResult Function(String errMessage) fetchError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetchLoading,
    TResult? Function(PlayerModel player)? fetchSuccess,
    TResult? Function(String errMessage)? fetchError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetchLoading,
    TResult Function(PlayerModel player)? fetchSuccess,
    TResult Function(String errMessage)? fetchError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(FetchLoading value) fetchLoading,
    required TResult Function(FetchSuccess value) fetchSuccess,
    required TResult Function(FetchError value) fetchError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(FetchLoading value)? fetchLoading,
    TResult? Function(FetchSuccess value)? fetchSuccess,
    TResult? Function(FetchError value)? fetchError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(FetchLoading value)? fetchLoading,
    TResult Function(FetchSuccess value)? fetchSuccess,
    TResult Function(FetchError value)? fetchError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchSinglePlayerStateCopyWith<$Res> {
  factory $FetchSinglePlayerStateCopyWith(FetchSinglePlayerState value,
          $Res Function(FetchSinglePlayerState) then) =
      _$FetchSinglePlayerStateCopyWithImpl<$Res, FetchSinglePlayerState>;
}

/// @nodoc
class _$FetchSinglePlayerStateCopyWithImpl<$Res,
        $Val extends FetchSinglePlayerState>
    implements $FetchSinglePlayerStateCopyWith<$Res> {
  _$FetchSinglePlayerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FetchSinglePlayerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$FetchSinglePlayerStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of FetchSinglePlayerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'FetchSinglePlayerState.initial()';
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
    required TResult Function() fetchLoading,
    required TResult Function(PlayerModel player) fetchSuccess,
    required TResult Function(String errMessage) fetchError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetchLoading,
    TResult? Function(PlayerModel player)? fetchSuccess,
    TResult? Function(String errMessage)? fetchError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetchLoading,
    TResult Function(PlayerModel player)? fetchSuccess,
    TResult Function(String errMessage)? fetchError,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(FetchLoading value) fetchLoading,
    required TResult Function(FetchSuccess value) fetchSuccess,
    required TResult Function(FetchError value) fetchError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(FetchLoading value)? fetchLoading,
    TResult? Function(FetchSuccess value)? fetchSuccess,
    TResult? Function(FetchError value)? fetchError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(FetchLoading value)? fetchLoading,
    TResult Function(FetchSuccess value)? fetchSuccess,
    TResult Function(FetchError value)? fetchError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements FetchSinglePlayerState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$FetchLoadingImplCopyWith<$Res> {
  factory _$$FetchLoadingImplCopyWith(
          _$FetchLoadingImpl value, $Res Function(_$FetchLoadingImpl) then) =
      __$$FetchLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchLoadingImplCopyWithImpl<$Res>
    extends _$FetchSinglePlayerStateCopyWithImpl<$Res, _$FetchLoadingImpl>
    implements _$$FetchLoadingImplCopyWith<$Res> {
  __$$FetchLoadingImplCopyWithImpl(
      _$FetchLoadingImpl _value, $Res Function(_$FetchLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of FetchSinglePlayerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchLoadingImpl implements FetchLoading {
  const _$FetchLoadingImpl();

  @override
  String toString() {
    return 'FetchSinglePlayerState.fetchLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetchLoading,
    required TResult Function(PlayerModel player) fetchSuccess,
    required TResult Function(String errMessage) fetchError,
  }) {
    return fetchLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetchLoading,
    TResult? Function(PlayerModel player)? fetchSuccess,
    TResult? Function(String errMessage)? fetchError,
  }) {
    return fetchLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetchLoading,
    TResult Function(PlayerModel player)? fetchSuccess,
    TResult Function(String errMessage)? fetchError,
    required TResult orElse(),
  }) {
    if (fetchLoading != null) {
      return fetchLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(FetchLoading value) fetchLoading,
    required TResult Function(FetchSuccess value) fetchSuccess,
    required TResult Function(FetchError value) fetchError,
  }) {
    return fetchLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(FetchLoading value)? fetchLoading,
    TResult? Function(FetchSuccess value)? fetchSuccess,
    TResult? Function(FetchError value)? fetchError,
  }) {
    return fetchLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(FetchLoading value)? fetchLoading,
    TResult Function(FetchSuccess value)? fetchSuccess,
    TResult Function(FetchError value)? fetchError,
    required TResult orElse(),
  }) {
    if (fetchLoading != null) {
      return fetchLoading(this);
    }
    return orElse();
  }
}

abstract class FetchLoading implements FetchSinglePlayerState {
  const factory FetchLoading() = _$FetchLoadingImpl;
}

/// @nodoc
abstract class _$$FetchSuccessImplCopyWith<$Res> {
  factory _$$FetchSuccessImplCopyWith(
          _$FetchSuccessImpl value, $Res Function(_$FetchSuccessImpl) then) =
      __$$FetchSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PlayerModel player});
}

/// @nodoc
class __$$FetchSuccessImplCopyWithImpl<$Res>
    extends _$FetchSinglePlayerStateCopyWithImpl<$Res, _$FetchSuccessImpl>
    implements _$$FetchSuccessImplCopyWith<$Res> {
  __$$FetchSuccessImplCopyWithImpl(
      _$FetchSuccessImpl _value, $Res Function(_$FetchSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of FetchSinglePlayerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = null,
  }) {
    return _then(_$FetchSuccessImpl(
      null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as PlayerModel,
    ));
  }
}

/// @nodoc

class _$FetchSuccessImpl implements FetchSuccess {
  const _$FetchSuccessImpl(this.player);

  @override
  final PlayerModel player;

  @override
  String toString() {
    return 'FetchSinglePlayerState.fetchSuccess(player: $player)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchSuccessImpl &&
            (identical(other.player, player) || other.player == player));
  }

  @override
  int get hashCode => Object.hash(runtimeType, player);

  /// Create a copy of FetchSinglePlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchSuccessImplCopyWith<_$FetchSuccessImpl> get copyWith =>
      __$$FetchSuccessImplCopyWithImpl<_$FetchSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetchLoading,
    required TResult Function(PlayerModel player) fetchSuccess,
    required TResult Function(String errMessage) fetchError,
  }) {
    return fetchSuccess(player);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetchLoading,
    TResult? Function(PlayerModel player)? fetchSuccess,
    TResult? Function(String errMessage)? fetchError,
  }) {
    return fetchSuccess?.call(player);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetchLoading,
    TResult Function(PlayerModel player)? fetchSuccess,
    TResult Function(String errMessage)? fetchError,
    required TResult orElse(),
  }) {
    if (fetchSuccess != null) {
      return fetchSuccess(player);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(FetchLoading value) fetchLoading,
    required TResult Function(FetchSuccess value) fetchSuccess,
    required TResult Function(FetchError value) fetchError,
  }) {
    return fetchSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(FetchLoading value)? fetchLoading,
    TResult? Function(FetchSuccess value)? fetchSuccess,
    TResult? Function(FetchError value)? fetchError,
  }) {
    return fetchSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(FetchLoading value)? fetchLoading,
    TResult Function(FetchSuccess value)? fetchSuccess,
    TResult Function(FetchError value)? fetchError,
    required TResult orElse(),
  }) {
    if (fetchSuccess != null) {
      return fetchSuccess(this);
    }
    return orElse();
  }
}

abstract class FetchSuccess implements FetchSinglePlayerState {
  const factory FetchSuccess(final PlayerModel player) = _$FetchSuccessImpl;

  PlayerModel get player;

  /// Create a copy of FetchSinglePlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchSuccessImplCopyWith<_$FetchSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchErrorImplCopyWith<$Res> {
  factory _$$FetchErrorImplCopyWith(
          _$FetchErrorImpl value, $Res Function(_$FetchErrorImpl) then) =
      __$$FetchErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errMessage});
}

/// @nodoc
class __$$FetchErrorImplCopyWithImpl<$Res>
    extends _$FetchSinglePlayerStateCopyWithImpl<$Res, _$FetchErrorImpl>
    implements _$$FetchErrorImplCopyWith<$Res> {
  __$$FetchErrorImplCopyWithImpl(
      _$FetchErrorImpl _value, $Res Function(_$FetchErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of FetchSinglePlayerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errMessage = null,
  }) {
    return _then(_$FetchErrorImpl(
      null == errMessage
          ? _value.errMessage
          : errMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchErrorImpl implements FetchError {
  const _$FetchErrorImpl(this.errMessage);

  @override
  final String errMessage;

  @override
  String toString() {
    return 'FetchSinglePlayerState.fetchError(errMessage: $errMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchErrorImpl &&
            (identical(other.errMessage, errMessage) ||
                other.errMessage == errMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errMessage);

  /// Create a copy of FetchSinglePlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchErrorImplCopyWith<_$FetchErrorImpl> get copyWith =>
      __$$FetchErrorImplCopyWithImpl<_$FetchErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetchLoading,
    required TResult Function(PlayerModel player) fetchSuccess,
    required TResult Function(String errMessage) fetchError,
  }) {
    return fetchError(errMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetchLoading,
    TResult? Function(PlayerModel player)? fetchSuccess,
    TResult? Function(String errMessage)? fetchError,
  }) {
    return fetchError?.call(errMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetchLoading,
    TResult Function(PlayerModel player)? fetchSuccess,
    TResult Function(String errMessage)? fetchError,
    required TResult orElse(),
  }) {
    if (fetchError != null) {
      return fetchError(errMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(FetchLoading value) fetchLoading,
    required TResult Function(FetchSuccess value) fetchSuccess,
    required TResult Function(FetchError value) fetchError,
  }) {
    return fetchError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(FetchLoading value)? fetchLoading,
    TResult? Function(FetchSuccess value)? fetchSuccess,
    TResult? Function(FetchError value)? fetchError,
  }) {
    return fetchError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(FetchLoading value)? fetchLoading,
    TResult Function(FetchSuccess value)? fetchSuccess,
    TResult Function(FetchError value)? fetchError,
    required TResult orElse(),
  }) {
    if (fetchError != null) {
      return fetchError(this);
    }
    return orElse();
  }
}

abstract class FetchError implements FetchSinglePlayerState {
  const factory FetchError(final String errMessage) = _$FetchErrorImpl;

  String get errMessage;

  /// Create a copy of FetchSinglePlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchErrorImplCopyWith<_$FetchErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
