import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/http/client.dart';
import '../../data/http/path.dart';
import '../../extensions/extensions.dart';
import '../../models/category.dart';
import '../../utility/utility.dart';
import 'big_category_response_state.dart';

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
    final answer = await client.post(path: APIPath.getYoutubeCategoryTree);

    if (answer != null) {
      await client.post(path: APIPath.getYoutubeCategoryTree).then((value) {
        final list = <Category>[];

        final getCategory = <String>[];
        for (var i = 0; i < value['data'].length.toString().toInt(); i++) {
          if (value['data'][i]['category1'] == null || value['data'][i]['category2'] == null || value['data'][i]['bunrui'] == null) {
            continue;
          }

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
}
