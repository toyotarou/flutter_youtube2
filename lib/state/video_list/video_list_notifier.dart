import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/http/client.dart';
import '../../data/http/path.dart';
import '../../extensions/extensions.dart';
import '../../models/video.dart';
import '../../utility/utility.dart';
import 'video_list_response_state.dart';

final videoListProvider = StateNotifierProvider.autoDispose<VideoListNotifier, VideoListResponseState>((ref) {
  final client = ref.read(httpClientProvider);

  final utility = Utility();

  return VideoListNotifier(const VideoListResponseState(), client, utility);
});

class VideoListNotifier extends StateNotifier<VideoListResponseState> {
  VideoListNotifier(super.state, this.client, this.utility);

  final HttpClient client;
  final Utility utility;

  Future<void> getVideoList({required String bunrui}) async {
    await client.post(path: APIPath.getYoutubeList, body: {'bunrui': bunrui}).then((value) {
      final list = <Video>[];

      for (var i = 0; i < value['data'].length.toString().toInt(); i++) {
        list.add(Video.fromJson(value['data'][i] as Map<String, dynamic>));
      }

      state = state.copyWith(videoList: list);
    }).catchError((error, _) {
      utility.showError('予期せぬエラーが発生しました');
    });
  }
}
