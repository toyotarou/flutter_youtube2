// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_youtube2/state/bunrui/bunrui_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';

class VideoBunruiDisplayAlert extends ConsumerWidget {
  VideoBunruiDisplayAlert({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text('Credit Input')],
                ),
                Container(),
              ],
            ),
            Divider(color: Colors.white.withOpacity(0.4), thickness: 5),
            GestureDetector(
              child: const Icon(Icons.list),
              onTap: () {
                
                
                
                _ref.read(bunruiProvider.notifier).setBunrui(bunrui: 'aaaaa');
                
                
                
                scaffoldKey.currentState!.openEndDrawer();
              },
            ),
            Divider(color: Colors.white.withOpacity(0.4), thickness: 5),
            GestureDetector(
              child: const Icon(Icons.list),
              onTap: () {
                _ref.read(bunruiProvider.notifier).setBunrui(bunrui: 'bbbbb');
                scaffoldKey.currentState!.openEndDrawer();
              },
            ),
            Divider(color: Colors.white.withOpacity(0.4), thickness: 5),
            GestureDetector(
              child: const Icon(Icons.list),
              onTap: () {
                _ref.read(bunruiProvider.notifier).setBunrui(bunrui: 'ccccc');
                scaffoldKey.currentState!.openEndDrawer();
              },
            ),
          ],
        ),
      ),
    );
  }
}
