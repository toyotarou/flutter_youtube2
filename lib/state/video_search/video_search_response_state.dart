import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_search_response_state.freezed.dart';

@freezed
class VideoSearchResponseState with _$VideoSearchResponseState {
  const factory VideoSearchResponseState({
    @Default('') String searchWord,
  }) = _VideoSearchResponseState;
}
