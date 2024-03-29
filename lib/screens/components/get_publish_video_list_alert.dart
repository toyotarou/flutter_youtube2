// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';
import '../../models/video.dart';
import '../../utility/function.dart';

class GetPublishVideoListAlert extends ConsumerWidget {
  GetPublishVideoListAlert({super.key, required this.type, required this.date, this.videoList});

  final String type;
  final DateTime date;
  final List<Video>? videoList;

  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      content: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height - 50,
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 12),
          child: Column(
            children: [
              Container(width: context.screenSize.width),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(color: Colors.blueGrey.withOpacity(0.2), borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(date.yyyymmdd),
                    Text(type),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Expanded(child: _displayVideoList()),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget _displayVideoList() {
    if (videoList == null) {
      return Container();
    }

    final list = <Widget>[];

    videoList!.forEach((element) {
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
                      (element.special == '1')
                          ? const Icon(Icons.star, color: Colors.greenAccent)
                          : Icon(Icons.star, color: Colors.grey.withOpacity(0.3)),
                      const SizedBox(height: 10),
                      const Icon(Icons.check_box_outline_blank, color: Colors.transparent),
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
    });

    return SingleChildScrollView(
      child: DefaultTextStyle(style: const TextStyle(fontSize: 12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: list)),
    );
  }
}
