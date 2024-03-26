import 'package:flutter_youtube2/state/big_category/big_category_response_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/http/client.dart';
import '../../data/http/path.dart';
import '../../extensions/extensions.dart';
import '../../models/category.dart';
import '../../utility/utility.dart';

final bigCategoryProvider = StateNotifierProvider.autoDispose<BigCategoryNotifier, BigCategoryResponseState>((ref) {
  final client = ref.read(httpClientProvider);

  final utility = Utility();

  return BigCategoryNotifier(const BigCategoryResponseState(), client, utility)..getBigCategory();
});

class BigCategoryNotifier extends StateNotifier<BigCategoryResponseState> {
  BigCategoryNotifier(super.state, this.client, this.utility);

  final HttpClient client;
  final Utility utility;

  Future<void> getBigCategory() async {
    await client.post(path: APIPath.getYoutubeCategoryTree).then((value) {
      final list = <Category>[];

      final getCategory = <String>[];
      for (var i = 0; i < value['data'].length.toString().toInt(); i++) {
        final category1 = value['data'][i]['category1'].toString();

        //---
        if (!getCategory.contains(category1)) {
          list.add(
            Category(
              category1: value['data'][i]['category1'].toString(),
              category2: value['data'][i]['category2'].toString(),
              bunrui: value['data'][i]['bunrui'].toString(),
            ),
          );
        }

        getCategory.add(category1);
      }

      state = state.copyWith(bigCategoryList: list);
    }).catchError((error, _) {
      utility.showError('予期せぬエラーが発生しました');
    });
  }
}
