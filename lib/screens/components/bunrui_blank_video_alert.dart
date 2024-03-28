// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_youtube2/screens/components/bunrui_input_alert.dart';
import 'package:flutter_youtube2/screens/components/parts/video_dialog.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';
import '../../state/video_list/video_list_notifier.dart';

class BunruiBlankVideoAlert extends ConsumerWidget {
  BunruiBlankVideoAlert({super.key});

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
              const SizedBox(height: 20),
              Expanded(child: displayBlankBunruiVideo()),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget displayBlankBunruiVideo() {
    final list = <Widget>[];

    _ref.watch(videoListProvider.select((value) => value.videoList)).forEach((element) {
      list.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(color: Colors.yellowAccent.withOpacity(0.1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  GestureDetector(
                    onTap: () {
                      VideoDialog(context: _context, widget: BunruiInputAlert(video: element));
                    },
                    child: const Icon(Icons.input),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: 180,
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/no_image.png',
                image: 'https://img.youtube.com/vi/${element.youtubeId}/mqdefault.jpg',
                imageErrorBuilder: (c, o, s) => Image.asset('assets/images/no_image.png'),
              ),
            ),
            const SizedBox(height: 5),
            Text(element.title),
            const SizedBox(height: 5),
            const Divider(color: Colors.white),
          ],
        ),
      );
    });

    return SingleChildScrollView(child: Column(children: list));
  }
}
