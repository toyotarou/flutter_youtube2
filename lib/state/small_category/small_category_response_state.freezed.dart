// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'small_category_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SmallCategoryResponseState {
  List<Category> get smallCategoryList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SmallCategoryResponseStateCopyWith<SmallCategoryResponseState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmallCategoryResponseStateCopyWith<$Res> {
  factory $SmallCategoryResponseStateCopyWith(SmallCategoryResponseState value,
          $Res Function(SmallCategoryResponseState) then) =
      _$SmallCategoryResponseStateCopyWithImpl<$Res,
          SmallCategoryResponseState>;
  @useResult
  $Res call({List<Category> smallCategoryList});
}

/// @nodoc
class _$SmallCategoryResponseStateCopyWithImpl<$Res,
        $Val extends SmallCategoryResponseState>
    implements $SmallCategoryResponseStateCopyWith<$Res> {
  _$SmallCategoryResponseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? smallCategoryList = null,
  }) {
    return _then(_value.copyWith(
      smallCategoryList: null == smallCategoryList
          ? _value.smallCategoryList
          : smallCategoryList // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SmallCategoryResponseStateImplCopyWith<$Res>
    implements $SmallCategoryResponseStateCopyWith<$Res> {
  factory _$$SmallCategoryResponseStateImplCopyWith(
          _$SmallCategoryResponseStateImpl value,
          $Res Function(_$SmallCategoryResponseStateImpl) then) =
      __$$SmallCategoryResponseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Category> smallCategoryList});
}

/// @nodoc
class __$$SmallCategoryResponseStateImplCopyWithImpl<$Res>
    extends _$SmallCategoryResponseStateCopyWithImpl<$Res,
        _$SmallCategoryResponseStateImpl>
    implements _$$SmallCategoryResponseStateImplCopyWith<$Res> {
  __$$SmallCategoryResponseStateImplCopyWithImpl(
      _$SmallCategoryResponseStateImpl _value,
      $Res Function(_$SmallCategoryResponseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? smallCategoryList = null,
  }) {
    return _then(_$SmallCategoryResponseStateImpl(
      smallCategoryList: null == smallCategoryList
          ? _value._smallCategoryList
          : smallCategoryList // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }
}

/// @nodoc

class _$SmallCategoryResponseStateImpl implements _SmallCategoryResponseState {
  const _$SmallCategoryResponseStateImpl(
      {final List<Category> smallCategoryList = const []})
      : _smallCategoryList = smallCategoryList;

  final List<Category> _smallCategoryList;
  @override
  @JsonKey()
  List<Category> get smallCategoryList {
    if (_smallCategoryList is EqualUnmodifiableListView)
      return _smallCategoryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_smallCategoryList);
  }

  @override
  String toString() {
    return 'SmallCategoryResponseState(smallCategoryList: $smallCategoryList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SmallCategoryResponseStateImpl &&
            const DeepCollectionEquality()
                .equals(other._smallCategoryList, _smallCategoryList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_smallCategoryList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SmallCategoryResponseStateImplCopyWith<_$SmallCategoryResponseStateImpl>
      get copyWith => __$$SmallCategoryResponseStateImplCopyWithImpl<
          _$SmallCategoryResponseStateImpl>(this, _$identity);
}

abstract class _SmallCategoryResponseState
    implements SmallCategoryResponseState {
  const factory _SmallCategoryResponseState(
          {final List<Category> smallCategoryList}) =
      _$SmallCategoryResponseStateImpl;

  @override
  List<Category> get smallCategoryList;
  @override
  @JsonKey(ignore: true)
  _$$SmallCategoryResponseStateImplCopyWith<_$SmallCategoryResponseStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
