// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';
import '../../models/category.dart';
import '../../state/bunrui/bunrui_notifier.dart';

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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     const Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [Text('Credit Input')],
            //     ),
            //     Container(),
            //   ],
            // ),
            // Divider(color: Colors.white.withOpacity(0.4), thickness: 5),
            //

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

          if (scaffoldKey.currentState != null) {
            scaffoldKey.currentState!.openEndDrawer();
          }
        },
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
            decoration: BoxDecoration(border: Border.all(color: Colors.white.withOpacity(0.3))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(element.bunrui),
                Container(),
              ],
            )),
      ));
    });

    return SingleChildScrollView(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: list));
  }
}
