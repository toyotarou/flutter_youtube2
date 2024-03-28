import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_setting_response_state.freezed.dart';

@freezed
class CategorySettingResponseState with _$CategorySettingResponseState {
  const factory CategorySettingResponseState({
    @Default('') String errorStr,
    @Default('') String selectedCategory1,
    @Default('') String inputedCategory1,
    @Default('') String selectedCategory2,
    @Default('') String inputedCategory2,
  }) = _CategorySettingResponseState;
}
