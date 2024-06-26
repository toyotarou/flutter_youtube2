// ignore_for_file: must_be_immutable, cascade_invocations

import 'package:flutter/material.dart';
import 'package:flutter_youtube2/state/video_list/video_list_notifier.dart';
import 'package:flutter_youtube2/state/video_search/video_search_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';
import '../../utility/function.dart';

class SearchVideoAlert extends ConsumerWidget {
  SearchVideoAlert({super.key});

  TextEditingController searchTextEditingController = TextEditingController();

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
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(width: context.screenSize.width),
              Row(
                children: [
                  Expanded(
                    child: TextField(controller: searchTextEditingController, decoration: const InputDecoration(labelText: 'word')),
                  ),
                  Consumer(
                    builder: (BuildContext context, WidgetRef ref, Widget? child) {
                      return SizedBox(
                        width: 100,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent.withOpacity(0.3)),
                          onPressed: () => ref.read(videoSearchProvider.notifier).setSearchWord(word: searchTextEditingController.text),
                          child: const Text('検索する', style: TextStyle(fontSize: 12)),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(child: displaySearchedVideo()),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget displaySearchedVideo() {
    final list = <Widget>[];

    final searchWord = _ref.watch(videoSearchProvider.select((value) => value.searchWord));

    if (searchWord != '') {
      final reg = RegExp(searchWord);

      _ref.watch(videoListProvider.select((value) => value.videoList)).forEach((element) {
        final match = reg.firstMatch(element.title);
        final match2 = reg.firstMatch(element.channelTitle);

        if (match != null || match2 != null) {
          var getdate = '';

          if (element.getdate != 'null') {
            final year = element.getdate.substring(0, 4);
            final month = element.getdate.substring(4, 6);
            final day = element.getdate.substring(6);
            getdate = '$year-$month-$day';
          }

          list.add(Container(
            margin: const EdgeInsets.only(top: 5, bottom: 10),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3))),
              color: Colors.transparent,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 180,
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/images/no_image.png',
                        image: 'https://img.youtube.com/vi/${element.youtubeId}/mqdefault.jpg',
                        imageErrorBuilder: (c, o, s) => Image.asset('assets/images/no_image.png'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.star, color: (element.special == '1') ? Colors.greenAccent : Colors.grey.withOpacity(0.3)),
                          const SizedBox(height: 10),
                          Container(),
                          const SizedBox(width: 20),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () => openBrowser(youtubeId: element.youtubeId, ref: _ref),
                            child: const Icon(Icons.link),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(element.title),
                const SizedBox(height: 5),
                Text.rich(
                  TextSpan(children: [
                    TextSpan(text: element.youtubeId),
                    if (element.playtime != 'null') ...[
                      const TextSpan(text: ' / '),
                      TextSpan(text: element.playtime, style: const TextStyle(color: Colors.yellowAccent)),
                    ],
                  ]),
                ),
                if (element.channelTitle != 'null') ...[
                  const SizedBox(height: 5),
                  Container(alignment: Alignment.topRight, child: Text(element.channelTitle)),
                ],
                if (getdate != '') ...[
                  const SizedBox(height: 5),
                  Container(
                    alignment: Alignment.topRight,
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(text: getdate),
                        const TextSpan(text: ' / '),
                        TextSpan(text: element.pubdate, style: const TextStyle(color: Colors.yellowAccent)),
                      ]),
                    ),
                  ),
                ],
              ],
            ),
          ));
        }
      });
    }

    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: list),
    );
  }
}
