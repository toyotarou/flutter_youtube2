import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/http/client.dart';
import '../../data/http/path.dart';
import '../../extensions/extensions.dart';
import '../../utility/utility.dart';
import 'bunrui_response_state.dart';

final bunruiProvider = StateNotifierProvider.autoDispose<BunruiNotifier, BunruiResponseState>((ref) {
  final client = ref.read(httpClientProvider);

  final utility = Utility();

  return BunruiNotifier(const BunruiResponseState(), client, utility);
});

class BunruiNotifier extends StateNotifier<BunruiResponseState> {
  BunruiNotifier(super.state, this.client, this.utility);

  final HttpClient client;
  final Utility utility;

  ///
  Future<void> setBunrui({required String bunrui}) async {
    state = state.copyWith(bunrui: bunrui);
  }

  ///
  Future<void> getBunruiMap() async {
    final answer = await client.post(path: APIPath.getYoutubeCategoryTree);

    if (answer != null) {
      await client.post(path: APIPath.getYoutubeCategoryTree).then((value) {
        final map = <String, Map<String, String>>{};

        for (var i = 0; i < value['data'].length.toString().toInt(); i++) {
          final bunrui = value['data'][i]['bunrui'].toString();
          final category1 = value['data'][i]['category1'].toString();
          final category2 = value['data'][i]['category2'].toString();
          map[bunrui] = {'category1': category1, 'category2': category2};
        }

        state = state.copyWith(bunruiMap: map);
      }).catchError((error, _) {
        utility.showError('予期せぬエラーが発生しました');
      });
    }
  }
}
