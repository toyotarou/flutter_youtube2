// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';
import '../../models/category.dart';
import '../../state/bunrui/bunrui_notifier.dart';
import '../../state/video_list/video_list_notifier.dart';

class VideoBunruiListAlert extends ConsumerWidget {
  VideoBunruiListAlert({super.key, required this.scaffoldKey, required this.category2, required this.categoryList});

  final GlobalKey<ScaffoldState> scaffoldKey;

  final String category2;
  final List<Category> categoryList;

  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Container(width: context.screenSize.width),
            Expanded(child: _displayBunruiList()),
          ],
        ),
      ),
    );
  }

  ///
  Widget _displayBunruiList() {
    final list = <Widget>[];

    categoryList.where((element) => element.category2 == category2).forEach((element) {
      list.add(GestureDetector(
        onTap: () {
          _ref.read(bunruiProvider.notifier).setBunrui(bunrui: element.bunrui);

          _ref.read(bunruiProvider.notifier).getBunruiMap();

          _ref.read(videoListProvider.notifier).getVideoList(bunrui: element.bunrui);

          if (scaffoldKey.currentState != null) {
            scaffoldKey.currentState!.openEndDrawer();
          }
        },
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3)))),
            child: Row(
              children: [
                Expanded(child: Text(element.bunrui, maxLines: 1, overflow: TextOverflow.ellipsis)),
                Container(),
              ],
            )),
      ));
    });

    return SingleChildScrollView(
      child: DefaultTextStyle(
        style: const TextStyle(fontSize: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: list),
      ),
    );
  }
}
