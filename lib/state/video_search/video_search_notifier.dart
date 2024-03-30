import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'video_search_response_state.dart';

final videoSearchProvider = StateNotifierProvider.autoDispose<VideoSearchNotifier, VideoSearchResponseState>((ref) {
  return VideoSearchNotifier(const VideoSearchResponseState());
});

class VideoSearchNotifier extends StateNotifier<VideoSearchResponseState> {
  VideoSearchNotifier(super.state);

  ///
  Future<void> setSearchWord({required String word}) async => state = state.copyWith(searchWord: word);
}
