import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/video.dart';

part 'video_list_response_state.freezed.dart';

@freezed
class VideoListResponseState with _$VideoListResponseState {
  const factory VideoListResponseState({
    @Default([]) List<Video> videoList,
    @Default([]) List<String> youtubeIdList,
  }) = _VideoListResponseState;
}
