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

  final youtubeIdList = List.generate(200, (index) => '');

  return VideoListNotifier(VideoListResponseState(youtubeIdList: youtubeIdList), client, utility);
});

class VideoListNotifier extends StateNotifier<VideoListResponseState> {
  VideoListNotifier(super.state, this.client, this.utility);

  final HttpClient client;
  final Utility utility;

  ///
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

  ///
  Future<void> setYoutubeIdList({required String youtubeId}) async {
    final list = [...state.youtubeIdList];

    if (list.contains(youtubeId)) {
      list.remove(youtubeId);
    } else {
      list.add(youtubeId);
    }

    state = state.copyWith(youtubeIdList: list);
  }

  ///
  Future<void> clearYoutubeIdList() async => state = state.copyWith(youtubeIdList: []);

  ///
  Future<void> manipulateVideoList({required String bunrui}) async {
    final youtubeIdList = [...state.youtubeIdList];

    final list = <String>[];
    youtubeIdList.forEach((element) {
      if (element != '') {
        list.add("'$element'");
      }
    });

    await client.post(path: APIPath.bunruiYoutubeData, body: {'bunrui': bunrui, 'youtube_id': list.join(',')}).catchError((error, _) {
      utility.showError('予期せぬエラーが発生しました');
    });
  }

  ///
  Future<void> updateVideoPlayedAt({required String youtubeId}) async {
    final uploadData = <String, dynamic>{};
    uploadData['date'] = DateTime.now().yyyymmdd;
    uploadData['youtube_id'] = youtubeId;

    await client.post(path: APIPath.updateVideoPlayedAt, body: uploadData).catchError((error, _) {
      utility.showError('予期せぬエラーが発生しました');
    });
  }

  ///
  Future<void> getBlankBunruiVideo() async {
    await client.post(path: APIPath.getBlankBunruiVideo).then((value) {
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
