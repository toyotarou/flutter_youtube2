import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/category.dart';

part 'small_category_response_state.freezed.dart';

@freezed
class SmallCategoryResponseState with _$SmallCategoryResponseState {
  const factory SmallCategoryResponseState({
    @Default([]) List<Category> smallCategoryList,
  }) = _SmallCategoryResponseState;
}
