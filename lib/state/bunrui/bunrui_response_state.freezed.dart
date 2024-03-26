// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bunrui_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BunruiResponseState {
  String get bunrui => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BunruiResponseStateCopyWith<BunruiResponseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BunruiResponseStateCopyWith<$Res> {
  factory $BunruiResponseStateCopyWith(
          BunruiResponseState value, $Res Function(BunruiResponseState) then) =
      _$BunruiResponseStateCopyWithImpl<$Res, BunruiResponseState>;
  @useResult
  $Res call({String bunrui});
}

/// @nodoc
class _$BunruiResponseStateCopyWithImpl<$Res, $Val extends BunruiResponseState>
    implements $BunruiResponseStateCopyWith<$Res> {
  _$BunruiResponseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bunrui = null,
  }) {
    return _then(_value.copyWith(
      bunrui: null == bunrui
          ? _value.bunrui
          : bunrui // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BunruiResponseStateImplCopyWith<$Res>
    implements $BunruiResponseStateCopyWith<$Res> {
  factory _$$BunruiResponseStateImplCopyWith(_$BunruiResponseStateImpl value,
          $Res Function(_$BunruiResponseStateImpl) then) =
      __$$BunruiResponseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String bunrui});
}

/// @nodoc
class __$$BunruiResponseStateImplCopyWithImpl<$Res>
    extends _$BunruiResponseStateCopyWithImpl<$Res, _$BunruiResponseStateImpl>
    implements _$$BunruiResponseStateImplCopyWith<$Res> {
  __$$BunruiResponseStateImplCopyWithImpl(_$BunruiResponseStateImpl _value,
      $Res Function(_$BunruiResponseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bunrui = null,
  }) {
    return _then(_$BunruiResponseStateImpl(
      bunrui: null == bunrui
          ? _value.bunrui
          : bunrui // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BunruiResponseStateImpl implements _BunruiResponseState {
  const _$BunruiResponseStateImpl({this.bunrui = ''});

  @override
  @JsonKey()
  final String bunrui;

  @override
  String toString() {
    return 'BunruiResponseState(bunrui: $bunrui)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BunruiResponseStateImpl &&
            (identical(other.bunrui, bunrui) || other.bunrui == bunrui));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bunrui);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BunruiResponseStateImplCopyWith<_$BunruiResponseStateImpl> get copyWith =>
      __$$BunruiResponseStateImplCopyWithImpl<_$BunruiResponseStateImpl>(
          this, _$identity);
}

abstract class _BunruiResponseState implements BunruiResponseState {
  const factory _BunruiResponseState({final String bunrui}) =
      _$BunruiResponseStateImpl;

  @override
  String get bunrui;
  @override
  @JsonKey(ignore: true)
  _$$BunruiResponseStateImplCopyWith<_$BunruiResponseStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
