import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/category.dart';

part 'big_category_response_state.freezed.dart';

@freezed
class BigCategoryResponseState with _$BigCategoryResponseState {
  const factory BigCategoryResponseState({
    @Default([]) List<Category> bigCategoryList,
  }) = _BigCategoryResponseState;
}
