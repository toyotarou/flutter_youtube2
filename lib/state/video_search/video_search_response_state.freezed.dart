// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_search_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VideoSearchResponseState {
  String get searchWord => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VideoSearchResponseStateCopyWith<VideoSearchResponseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoSearchResponseStateCopyWith<$Res> {
  factory $VideoSearchResponseStateCopyWith(VideoSearchResponseState value,
          $Res Function(VideoSearchResponseState) then) =
      _$VideoSearchResponseStateCopyWithImpl<$Res, VideoSearchResponseState>;
  @useResult
  $Res call({String searchWord});
}

/// @nodoc
class _$VideoSearchResponseStateCopyWithImpl<$Res,
        $Val extends VideoSearchResponseState>
    implements $VideoSearchResponseStateCopyWith<$Res> {
  _$VideoSearchResponseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchWord = null,
  }) {
    return _then(_value.copyWith(
      searchWord: null == searchWord
          ? _value.searchWord
          : searchWord // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoSearchResponseStateImplCopyWith<$Res>
    implements $VideoSearchResponseStateCopyWith<$Res> {
  factory _$$VideoSearchResponseStateImplCopyWith(
          _$VideoSearchResponseStateImpl value,
          $Res Function(_$VideoSearchResponseStateImpl) then) =
      __$$VideoSearchResponseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String searchWord});
}

/// @nodoc
class __$$VideoSearchResponseStateImplCopyWithImpl<$Res>
    extends _$VideoSearchResponseStateCopyWithImpl<$Res,
        _$VideoSearchResponseStateImpl>
    implements _$$VideoSearchResponseStateImplCopyWith<$Res> {
  __$$VideoSearchResponseStateImplCopyWithImpl(
      _$VideoSearchResponseStateImpl _value,
      $Res Function(_$VideoSearchResponseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchWord = null,
  }) {
    return _then(_$VideoSearchResponseStateImpl(
      searchWord: null == searchWord
          ? _value.searchWord
          : searchWord // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$VideoSearchResponseStateImpl implements _VideoSearchResponseState {
  const _$VideoSearchResponseStateImpl({this.searchWord = ''});

  @override
  @JsonKey()
  final String searchWord;

  @override
  String toString() {
    return 'VideoSearchResponseState(searchWord: $searchWord)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoSearchResponseStateImpl &&
            (identical(other.searchWord, searchWord) ||
                other.searchWord == searchWord));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchWord);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoSearchResponseStateImplCopyWith<_$VideoSearchResponseStateImpl>
      get copyWith => __$$VideoSearchResponseStateImplCopyWithImpl<
          _$VideoSearchResponseStateImpl>(this, _$identity);
}

abstract class _VideoSearchResponseState implements VideoSearchResponseState {
  const factory _VideoSearchResponseState({final String searchWord}) =
      _$VideoSearchResponseStateImpl;

  @override
  String get searchWord;
  @override
  @JsonKey(ignore: true)
  _$$VideoSearchResponseStateImplCopyWith<_$VideoSearchResponseStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
