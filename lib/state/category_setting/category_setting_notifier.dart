import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/http/client.dart';
import '../../data/http/path.dart';
import '../../utility/utility.dart';
import 'category_setting_response_state.dart';

final categorySettingProvider = StateNotifierProvider.autoDispose<CategorySettingNotifier, CategorySettingResponseState>((ref) {
  final client = ref.read(httpClientProvider);

  final utility = Utility();

  return CategorySettingNotifier(const CategorySettingResponseState(), client, utility);
});

class CategorySettingNotifier extends StateNotifier<CategorySettingResponseState> {
  CategorySettingNotifier(super.state, this.client, this.utility);

  final HttpClient client;
  final Utility utility;

  ///
  Future<void> setSelectedCategory1({required String value}) async => state = state.copyWith(selectedCategory1: value);

  ///
  Future<void> setInputedCategory1({required String value}) async => state = state.copyWith(inputedCategory1: value);

  ///
  Future<void> setSelectedCategory2({required String value}) async => state = state.copyWith(selectedCategory2: value);

  ///
  Future<void> setInputedCategory2({required String value}) async => state = state.copyWith(inputedCategory2: value);

  ///
  Future<void> inputBunruiCategory({required String youtubeId, required String cate1, required String cate2, required String bunrui}) async {
    final uploadData = <String, dynamic>{};
    uploadData['bunrui'] = bunrui;
    uploadData['category1'] = cate1;
    uploadData['category2'] = cate2;
    uploadData['youtube_id'] = youtubeId;

    await client.post(path: APIPath.oneBunruiInput, body: uploadData).catchError((error, _) {
      utility.showError('予期せぬエラーが発生しました');
    });
  }
}
