// ignore_for_file: must_be_immutable, cascade_invocations, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';
import '../../state/big_category/big_category_notifier.dart';
import '../../state/bunrui/bunrui_notifier.dart';
import '../../state/category_setting/category_setting_notifier.dart';
import '../../state/small_category/small_category_notifier.dart';

class BunruiListAlert extends ConsumerWidget {
  BunruiListAlert({super.key, required this.tecs});

  final List<TextEditingController> tecs;

  List<String> bunruiList = [];

  late BuildContext _context;
  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    makeBunruiList();

    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      content: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height - 50,
        child: SingleChildScrollView(
          child: DefaultTextStyle(
            style: const TextStyle(fontSize: 12),
            child: Column(
              children: [
                Container(width: context.screenSize.width),
                displayBunruiList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///
  Widget displayBunruiList() {
    final bunruiMap = _ref.watch(bunruiProvider.select((value) => value.bunruiMap));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: bunruiList.map(
        (value) {
          if (value == '') {
            return Container();
          }

          final category1 = bunruiMap[value]?['category1'];
          final category2 = bunruiMap[value]?['category2'];

          return Slidable(
            startActionPane: ActionPane(
              extentRatio: 1,
              motion: const ScrollMotion(), // (5)
              children: [
                SlidableAction(
                  onPressed: (_) {},
                  backgroundColor: Colors.blueAccent.withOpacity(0.3),
                  foregroundColor: Colors.white,
                  label: category1,
                ),
                SlidableAction(
                  onPressed: (_) {},
                  backgroundColor: Colors.blueAccent.withOpacity(0.1),
                  foregroundColor: Colors.white,
                  label: category2,
                ),
              ],
            ),
            child: GestureDetector(
              onTap: () async {
                await _ref.watch(categorySettingProvider.notifier).setInputedCategory1(value: category1 ?? '');

                await _ref.watch(categorySettingProvider.notifier).setInputedCategory2(value: category2 ?? '');

                if (bunruiMap[value] != null) {
                  tecs[0].text = (bunruiMap[value]!['category1'] != null) ? bunruiMap[value]!['category1']! : '';
                  tecs[1].text = (bunruiMap[value]!['category2'] != null) ? bunruiMap[value]!['category2']! : '';
                }

                tecs[2].text = value;

                Navigator.pop(_context);
              },
              child: Container(
                width: _context.screenSize.width,
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3)))),
                child: Text(value, style: const TextStyle(fontSize: 14)),
              ),
            ),
          );
        },
      ).toList(),
    );
  }

  ///
  void makeBunruiList() {
    bunruiList = [];

    final bl = <String>[];

    _ref.watch(bigCategoryProvider.select((value) => value.bigCategoryList)).forEach((element) => _ref
        .watch(smallCategoryProvider(element.category1).select((value) => value.smallCategoryList))
        .forEach((element2) => bl.add(element2.bunrui)));

    bl.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));

    bl.forEach((element) => bunruiList.add(element));
  }
}
