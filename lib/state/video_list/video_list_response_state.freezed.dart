// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_list_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VideoListResponseState {
  List<Video> get videoList => throw _privateConstructorUsedError;
  List<String> get youtubeIdList => throw _privateConstructorUsedError;
  List<SpecialVideo> get specialVideoList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VideoListResponseStateCopyWith<VideoListResponseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoListResponseStateCopyWith<$Res> {
  factory $VideoListResponseStateCopyWith(VideoListResponseState value,
          $Res Function(VideoListResponseState) then) =
      _$VideoListResponseStateCopyWithImpl<$Res, VideoListResponseState>;
  @useResult
  $Res call(
      {List<Video> videoList,
      List<String> youtubeIdList,
      List<SpecialVideo> specialVideoList});
}

/// @nodoc
class _$VideoListResponseStateCopyWithImpl<$Res,
        $Val extends VideoListResponseState>
    implements $VideoListResponseStateCopyWith<$Res> {
  _$VideoListResponseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoList = null,
    Object? youtubeIdList = null,
    Object? specialVideoList = null,
  }) {
    return _then(_value.copyWith(
      videoList: null == videoList
          ? _value.videoList
          : videoList // ignore: cast_nullable_to_non_nullable
              as List<Video>,
      youtubeIdList: null == youtubeIdList
          ? _value.youtubeIdList
          : youtubeIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      specialVideoList: null == specialVideoList
          ? _value.specialVideoList
          : specialVideoList // ignore: cast_nullable_to_non_nullable
              as List<SpecialVideo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoListResponseStateImplCopyWith<$Res>
    implements $VideoListResponseStateCopyWith<$Res> {
  factory _$$VideoListResponseStateImplCopyWith(
          _$VideoListResponseStateImpl value,
          $Res Function(_$VideoListResponseStateImpl) then) =
      __$$VideoListResponseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Video> videoList,
      List<String> youtubeIdList,
      List<SpecialVideo> specialVideoList});
}

/// @nodoc
class __$$VideoListResponseStateImplCopyWithImpl<$Res>
    extends _$VideoListResponseStateCopyWithImpl<$Res,
        _$VideoListResponseStateImpl>
    implements _$$VideoListResponseStateImplCopyWith<$Res> {
  __$$VideoListResponseStateImplCopyWithImpl(
      _$VideoListResponseStateImpl _value,
      $Res Function(_$VideoListResponseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoList = null,
    Object? youtubeIdList = null,
    Object? specialVideoList = null,
  }) {
    return _then(_$VideoListResponseStateImpl(
      videoList: null == videoList
          ? _value._videoList
          : videoList // ignore: cast_nullable_to_non_nullable
              as List<Video>,
      youtubeIdList: null == youtubeIdList
          ? _value._youtubeIdList
          : youtubeIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      specialVideoList: null == specialVideoList
          ? _value._specialVideoList
          : specialVideoList // ignore: cast_nullable_to_non_nullable
              as List<SpecialVideo>,
    ));
  }
}

/// @nodoc

class _$VideoListResponseStateImpl implements _VideoListResponseState {
  const _$VideoListResponseStateImpl(
      {final List<Video> videoList = const [],
      final List<String> youtubeIdList = const [],
      final List<SpecialVideo> specialVideoList = const []})
      : _videoList = videoList,
        _youtubeIdList = youtubeIdList,
        _specialVideoList = specialVideoList;

  final List<Video> _videoList;
  @override
  @JsonKey()
  List<Video> get videoList {
    if (_videoList is EqualUnmodifiableListView) return _videoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videoList);
  }

  final List<String> _youtubeIdList;
  @override
  @JsonKey()
  List<String> get youtubeIdList {
    if (_youtubeIdList is EqualUnmodifiableListView) return _youtubeIdList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_youtubeIdList);
  }

  final List<SpecialVideo> _specialVideoList;
  @override
  @JsonKey()
  List<SpecialVideo> get specialVideoList {
    if (_specialVideoList is EqualUnmodifiableListView)
      return _specialVideoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_specialVideoList);
  }

  @override
  String toString() {
    return 'VideoListResponseState(videoList: $videoList, youtubeIdList: $youtubeIdList, specialVideoList: $specialVideoList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoListResponseStateImpl &&
            const DeepCollectionEquality()
                .equals(other._videoList, _videoList) &&
            const DeepCollectionEquality()
                .equals(other._youtubeIdList, _youtubeIdList) &&
            const DeepCollectionEquality()
                .equals(other._specialVideoList, _specialVideoList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_videoList),
      const DeepCollectionEquality().hash(_youtubeIdList),
      const DeepCollectionEquality().hash(_specialVideoList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoListResponseStateImplCopyWith<_$VideoListResponseStateImpl>
      get copyWith => __$$VideoListResponseStateImplCopyWithImpl<
          _$VideoListResponseStateImpl>(this, _$identity);
}

abstract class _VideoListResponseState implements VideoListResponseState {
  const factory _VideoListResponseState(
          {final List<Video> videoList,
          final List<String> youtubeIdList,
          final List<SpecialVideo> specialVideoList}) =
      _$VideoListResponseStateImpl;

  @override
  List<Video> get videoList;
  @override
  List<String> get youtubeIdList;
  @override
  List<SpecialVideo> get specialVideoList;
  @override
  @JsonKey(ignore: true)
  _$$VideoListResponseStateImplCopyWith<_$VideoListResponseStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
