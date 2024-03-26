// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_youtube2/screens/components/parts/video_dialog.dart';
import 'package:flutter_youtube2/screens/components/video_bunrui_display_alert.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../extensions/extensions.dart';
import '../../../state/small_category/small_category_notifier.dart';
import '../../../utility/utility.dart';

class CategoryListPage extends ConsumerWidget {
  CategoryListPage({super.key, required this.category1, required this.scaffoldKey});

  final String category1;

  final GlobalKey<ScaffoldState> scaffoldKey;

  final Utility _utility = Utility();

  late BuildContext _context;
  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          _utility.getBackGround(),
          Column(
            children: [
              Expanded(child: displaySmallCategory()),
            ],
          ),
        ],
      ),
    );
  }

  ///
  Widget displaySmallCategory() {
    final list = <Widget>[];

    final category2List = <String>[];
    _ref.watch(smallCategoryProvider(category1).select((value) => value.smallCategoryList)).forEach((element) {
      if (!category2List.contains(element.category2)) {
        list.add(Stack(
          children: [
            Positioned(
              right: -50,
              top: -40,
              child: Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 5, color: Colors.blueAccent.withOpacity(0.5)),
                  color: Colors.transparent,
                ),
              ),
            ),

            //

            Positioned(
              left: -50,
              bottom: -40,
              child: Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 5, color: Colors.blueAccent.withOpacity(0.5)),
                  color: Colors.transparent,
                ),
              ),
            ),

            //

            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              margin: const EdgeInsets.all(3),
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
              width: _context.screenSize.width,
              child: Row(
                children: [
                  GestureDetector(
                    child: const Icon(Icons.ac_unit),
                    onTap: () {
                      VideoDialog(
                        context: _context,
                        widget: VideoBunruiDisplayAlert(scaffoldKey: scaffoldKey),
                      );
                    },
                  ),
                  const SizedBox(width: 20),
                  Expanded(child: Text(element.category2)),
                ],
              ),
            ),
          ],
        ));
      }

      category2List.add(element.category2);
    });

    return SingleChildScrollView(child: Column(children: list));
  }
}
