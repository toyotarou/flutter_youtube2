import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/http/client.dart';
import '../../data/http/path.dart';
import '../../extensions/extensions.dart';
import '../../models/category.dart';
import '../../utility/utility.dart';
import 'small_category_response_state.dart';

final smallCategoryProvider = StateNotifierProvider.autoDispose.family<SmallCategoryNotifier, SmallCategoryResponseState, String>((ref, category1) {
  final client = ref.read(httpClientProvider);

  final utility = Utility();

  return SmallCategoryNotifier(const SmallCategoryResponseState(), client, utility)..getSmallCategory(category1: category1);
});

class SmallCategoryNotifier extends StateNotifier<SmallCategoryResponseState> {
  SmallCategoryNotifier(super.state, this.client, this.utility);

  final HttpClient client;
  final Utility utility;

  Future<void> getSmallCategory({required String category1}) async {
    await client.post(path: APIPath.getYoutubeCategoryTree).then((value) {
      final list = <Category>[];

      for (var i = 0; i < value['data'].length.toString().toInt(); i++) {
        //---
        if (category1 == value['data'][i]['category1']) {
          list.add(
            Category(
              category1: value['data'][i]['category1'].toString(),
              category2: value['data'][i]['category2'].toString(),
              bunrui: value['data'][i]['bunrui'].toString(),
            ),
          );
        }
      }

      state = state.copyWith(smallCategoryList: list);
    }).catchError((error, _) {
      utility.showError('予期せぬエラーが発生しました');
    });
  }
}
