// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'big_category_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BigCategoryResponseState {
  List<Category> get bigCategoryList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BigCategoryResponseStateCopyWith<BigCategoryResponseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BigCategoryResponseStateCopyWith<$Res> {
  factory $BigCategoryResponseStateCopyWith(BigCategoryResponseState value,
          $Res Function(BigCategoryResponseState) then) =
      _$BigCategoryResponseStateCopyWithImpl<$Res, BigCategoryResponseState>;
  @useResult
  $Res call({List<Category> bigCategoryList});
}

/// @nodoc
class _$BigCategoryResponseStateCopyWithImpl<$Res,
        $Val extends BigCategoryResponseState>
    implements $BigCategoryResponseStateCopyWith<$Res> {
  _$BigCategoryResponseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bigCategoryList = null,
  }) {
    return _then(_value.copyWith(
      bigCategoryList: null == bigCategoryList
          ? _value.bigCategoryList
          : bigCategoryList // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BigCategoryResponseStateImplCopyWith<$Res>
    implements $BigCategoryResponseStateCopyWith<$Res> {
  factory _$$BigCategoryResponseStateImplCopyWith(
          _$BigCategoryResponseStateImpl value,
          $Res Function(_$BigCategoryResponseStateImpl) then) =
      __$$BigCategoryResponseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Category> bigCategoryList});
}

/// @nodoc
class __$$BigCategoryResponseStateImplCopyWithImpl<$Res>
    extends _$BigCategoryResponseStateCopyWithImpl<$Res,
        _$BigCategoryResponseStateImpl>
    implements _$$BigCategoryResponseStateImplCopyWith<$Res> {
  __$$BigCategoryResponseStateImplCopyWithImpl(
      _$BigCategoryResponseStateImpl _value,
      $Res Function(_$BigCategoryResponseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bigCategoryList = null,
  }) {
    return _then(_$BigCategoryResponseStateImpl(
      bigCategoryList: null == bigCategoryList
          ? _value._bigCategoryList
          : bigCategoryList // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }
}

/// @nodoc

class _$BigCategoryResponseStateImpl implements _BigCategoryResponseState {
  const _$BigCategoryResponseStateImpl(
      {final List<Category> bigCategoryList = const []})
      : _bigCategoryList = bigCategoryList;

  final List<Category> _bigCategoryList;
  @override
  @JsonKey()
  List<Category> get bigCategoryList {
    if (_bigCategoryList is EqualUnmodifiableListView) return _bigCategoryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bigCategoryList);
  }

  @override
  String toString() {
    return 'BigCategoryResponseState(bigCategoryList: $bigCategoryList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BigCategoryResponseStateImpl &&
            const DeepCollectionEquality()
                .equals(other._bigCategoryList, _bigCategoryList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_bigCategoryList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BigCategoryResponseStateImplCopyWith<_$BigCategoryResponseStateImpl>
      get copyWith => __$$BigCategoryResponseStateImplCopyWithImpl<
          _$BigCategoryResponseStateImpl>(this, _$identity);
}

abstract class _BigCategoryResponseState implements BigCategoryResponseState {
  const factory _BigCategoryResponseState(
      {final List<Category> bigCategoryList}) = _$BigCategoryResponseStateImpl;

  @override
  List<Category> get bigCategoryList;
  @override
  @JsonKey(ignore: true)
  _$$BigCategoryResponseStateImplCopyWith<_$BigCategoryResponseStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
