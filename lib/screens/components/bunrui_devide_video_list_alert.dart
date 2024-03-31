// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_youtube2/state/video_list/video_list_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';
import '../../models/video.dart';
import '../../utility/function.dart';

class BunruiDevideVideoListAlert extends ConsumerWidget {
  BunruiDevideVideoListAlert({super.key, required this.videoNumThreeOverChannelList, required this.videoNumThreeOverChannelMap});

  final List<String> videoNumThreeOverChannelList;

  final Map<String, List<Video>> videoNumThreeOverChannelMap;

  late BuildContext _context;
  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  GestureDetector(
                    onTap: () async {
                      await _ref.read(videoListProvider.notifier).manipulateVideoList(bunrui: 'erase');

                      await onTapGood3(() async {
                        Navigator.pop(_context);

                        Navigator.pop(_context);
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text('分類消去', style: TextStyle(fontSize: 12)),
                    ),
                  ),
                ],
              ),
              Expanded(child: displayBunruiDevideList()),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget displayBunruiDevideList() {
    final list = <Widget>[];

    final youtubeIdList = _ref.watch(videoListProvider.select((value) => value.youtubeIdList));

    videoNumThreeOverChannelList.forEach((element2) {
      list.add(ExpansionTile(
        title: Text(element2, style: const TextStyle(fontSize: 12)),
        children: (videoNumThreeOverChannelMap[element2] == null)
            ? []
            : videoNumThreeOverChannelMap[element2]!.map((element) {
                var getdate = '';

                if (element.getdate != 'null') {
                  final year = element.getdate.substring(0, 4);
                  final month = element.getdate.substring(4, 6);
                  final day = element.getdate.substring(6);
                  getdate = '$year-$month-$day';
                }

                return Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 10),
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3))),
                    color: (youtubeIdList.contains(element.youtubeId)) ? Colors.greenAccent.withOpacity(0.2) : Colors.transparent,
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
                                GestureDetector(
                                  onTap: () {
                                    _ref.read(videoListProvider.notifier).setYoutubeIdList(youtubeId: element.youtubeId);
                                  },
                                  child: const Icon(Icons.control_point),
                                ),
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
                );
              }).toList(),
      ));
    });

    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: list),
    );
  }
}
