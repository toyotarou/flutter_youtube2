// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_youtube2/state/bunrui/bunrui_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';
import '../../models/video.dart';
import '../../state/big_category/big_category_notifier.dart';
import '../../state/category_setting/category_setting_notifier.dart';
import '../../state/small_category/small_category_notifier.dart';
import '../../state/video_list/video_list_notifier.dart';
import '../../utility/function.dart';
import 'bunrui_list_alert.dart';
import 'parts/video_dialog.dart';

class BunruiInputAlert extends ConsumerWidget {
  BunruiInputAlert({super.key, required this.video});

  final Video video;

  List<String> category1List = [];
  List<String> category2List = [];

  List<TextEditingController> tecs = [];

  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

    makeTecs();

    makeCategoryList();

    final categorySettingState = ref.watch(categorySettingProvider);

    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: double.infinity,
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Container(width: context.screenSize.width),
                const SizedBox(height: 20),
                SizedBox(
                  width: 180,
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/no_image.png',
                    image: 'https://img.youtube.com/vi/${video.youtubeId}/mqdefault.jpg',
                    imageErrorBuilder: (c, o, s) => Image.asset('assets/images/no_image.png'),
                  ),
                ),
                Divider(color: Colors.white.withOpacity(0.3), thickness: 2),
                setCategory1Block(),
                const SizedBox(height: 20),
                Divider(color: Colors.white.withOpacity(0.3), thickness: 2),
                setCategory2Block(),
                const SizedBox(height: 20),
                Divider(color: Colors.white.withOpacity(0.3), thickness: 2),
                SizedBox(
                  width: double.infinity,
                  child: TextField(
                    controller: tecs[2],
                    decoration: const InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                    ),
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () async {
                        await _ref.read(bunruiProvider.notifier).getBunruiMap();

                        await onTapGood3(
                          () => VideoDialog(
                            context: context,
                            widget: BunruiListAlert(tecs: tecs),
                            paddingLeft: context.screenSize.width * 0.3,
                            paddingTop: 100,
                            clearBarrierColor: true,
                          ),
                        );
                      },
                      icon: const Icon(Icons.list),
                    ),
                    IconButton(
                      onPressed: () async {
                        final cate1 = (categorySettingState.selectedCategory1 != '')
                            ? categorySettingState.selectedCategory1
                            : categorySettingState.inputedCategory1;

                        final cate2 = (categorySettingState.selectedCategory2 != '')
                            ? categorySettingState.selectedCategory2
                            : categorySettingState.inputedCategory2;

                        if (cate1 == '' || cate2 == '') {
                          return;
                        }

                        await ref
                            .watch(categorySettingProvider.notifier)
                            .inputBunruiCategory(youtubeId: video.youtubeId, cate1: cate1, cate2: cate2, bunrui: tecs[2].text);

                        /// notifier 未分類の動画を呼び出す
                        await ref.watch(videoListProvider.notifier).getBlankBunruiVideo();

                        await onTapGood3(() async => Navigator.pop(context));
                      },
                      icon: const Icon(Icons.input),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///
  Widget setCategory1Block() {
    final categorySettingState = _ref.watch(categorySettingProvider);

    return Container(
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.blueAccent.withOpacity(0.5), width: 5))),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.blueAccent.withOpacity(0.2)),
            child: DropdownButton(
              value: categorySettingState.selectedCategory1,
              icon: const Visibility(visible: false, child: Icon(Icons.arrow_drop_down)),
              items: category1List.map((val) => DropdownMenuItem(value: val, child: Text(val))).toList(),
              onChanged: (value) => _ref.watch(categorySettingProvider.notifier).setSelectedCategory1(value: value!),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: TextField(
              controller: tecs[0],
              decoration: const InputDecoration(
                filled: true,
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
              ),
              style: const TextStyle(fontSize: 12),
              onChanged: (value) => _ref.watch(categorySettingProvider.notifier).setInputedCategory1(value: value),
            ),
          ),
        ],
      ),
    );
  }

  ///
  Widget setCategory2Block() {
    final categorySettingState = _ref.watch(categorySettingProvider);

    return Container(
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.blueAccent.withOpacity(0.5),
            width: 5,
          ),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.blueAccent.withOpacity(0.2)),
            child: DropdownButton(
              value: categorySettingState.selectedCategory2,
              icon: const Visibility(visible: false, child: Icon(Icons.arrow_drop_down)),
              items: category2List.map((val) => DropdownMenuItem(value: val, child: Text(val))).toList(),
              onChanged: (value) => _ref.watch(categorySettingProvider.notifier).setSelectedCategory2(value: value!),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: TextField(
              controller: tecs[1],
              decoration: const InputDecoration(
                filled: true,
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
              ),
              style: const TextStyle(fontSize: 12),
              onChanged: (value) => _ref.watch(categorySettingProvider.notifier).setInputedCategory2(value: value),
            ),
          ),
        ],
      ),
    );
  }

  ///
  void makeTecs() {
    for (var i = 0; i < 3; i++) {
      tecs.add(TextEditingController(text: ''));
    }
  }

  ///
  void makeCategoryList() {
    category1List = [''];
    category2List = [''];

    final bigCategoryList = _ref.watch(bigCategoryProvider.select((value) => value.bigCategoryList));

    final keepCategory2 = <String>[];

    bigCategoryList.forEach((element) {
      //---// category1
      if (element.category1 != '') {
        category1List.add(element.category1);
      }

      //---// category2
      _ref.watch(smallCategoryProvider(element.category1).select((value) => value.smallCategoryList)).forEach((element2) {
        if (!keepCategory2.contains(element2.category2)) {
          if (element2.category2 != '') {
            category2List.add(element2.category2);
          }
        }

        keepCategory2.add(element2.category2);
      });
    });
  }
}
