// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/category.dart';
import '../state/big_category/big_category_notifier.dart';
import '../state/bunrui/bunrui_notifier.dart';
import '../state/small_category/small_category_notifier.dart';
import 'components/pages/category_list_page.dart';
import 'components/parts/video_dialog_horizontal_half.dart';
import 'components/video_bunrui_list_alert.dart';

class TabInfo {
  TabInfo(this.label, this.widget);

  String label;
  Widget widget;
}

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final List<TabInfo> tabs = [];

  late BuildContext _context;
  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    makeBigCategoryTab();

    if (tabs.isEmpty) {
      return Container();
    }





    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        //
        key: scaffoldKey,

        appBar: AppBar(
          elevation: 0,
          title: const Text('Video Category'),
          leading: const Icon(Icons.check_box_outline_blank, color: Colors.transparent),
          actions: const [
            Icon(Icons.check_box_outline_blank, color: Colors.transparent),
          ],
          flexibleSpace: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/bg.png'), fit: BoxFit.cover),
                ),
              ),
              Container(decoration: BoxDecoration(color: Colors.black.withOpacity(0.5))),
            ],
          ),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.blueAccent,
            tabs: tabs.map((TabInfo tab) => Tab(text: tab.label)).toList(),
          ),
        ),

        //

        body: TabBarView(children: tabs.map((tab) => tab.widget).toList()),

        //

        // floatingActionButton: FabCircularMenuPlus(
        //   ringColor: Colors.blueAccent.withOpacity(0.3),
        //   fabOpenColor: Colors.blueAccent.withOpacity(0.3),
        //   fabCloseColor: Colors.blueAccent.withOpacity(0.3),
        //   ringWidth: 10,
        //   ringDiameter: 250,
        //   children: <Widget>[
        //     IconButton(
        //       icon: const Icon(Icons.recycling, color: Colors.purpleAccent),
        //       onPressed: () {},
        //       // onPressed: () {
        //       //   Navigator.pushNamed(context, '/recycle');
        //       // },
        //     ),
        //     IconButton(
        //       icon: const Icon(Icons.star),
        //       onPressed: () => BunruiDialog(context: context, widget: SpecialVideoAlert()),
        //     ),
        //     IconButton(
        //       icon: const Icon(Icons.arrow_downward),
        //       onPressed: () => BunruiDialog(context: context, widget: HistoryVideoAlert()),
        //     ),
        //     IconButton(
        //       icon: const Icon(Icons.search),
        //       onPressed: () => BunruiDialog(context: context, widget: SearchVideoAlert()),
        //     ),
        //     IconButton(
        //       icon: const Icon(Icons.refresh, color: Colors.yellowAccent),
        //       onPressed: () {
        //         Navigator.pushReplacement(
        //           context,
        //           MaterialPageRoute(builder: (context) => HomeScreen()),
        //         );
        //       },
        //     ),
        //   ],
        // ),

        endDrawer: _dispEndDrawer(),
      ),
    );
  }

  ///
  Widget _dispEndDrawer() {
    final bunrui = _ref.watch(bunruiProvider.select((value) => value.bunrui));

    final bunruiMap = _ref.watch(bunruiProvider.select((value) => value.bunruiMap));

    var smallCategoryList = <Category>[];

    if (bunruiMap[bunrui] != null) {
      smallCategoryList = _ref.watch(smallCategoryProvider(bunruiMap[bunrui]!['category1']!).select((value) => value.smallCategoryList));
    }

    return Drawer(
      backgroundColor: Colors.blueGrey.withOpacity(0.2),
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const Text('end drawer'),
            Text((bunruiMap[bunrui] != null) ? bunruiMap[bunrui]!['category1']! : ''),
            Text((bunruiMap[bunrui] != null) ? bunruiMap[bunrui]!['category2']! : ''),
            Text(bunrui),
            Row(
              children: [
                Container(),
                IconButton(
                    onPressed: () {
                      VideoDialogHorizontalHalf(
                        context: _context,
                        widget: VideoBunruiListAlert(
                          scaffoldKey: scaffoldKey,
                          category2: (bunruiMap[bunrui] != null) ? bunruiMap[bunrui]!['category2']! : '',
                          categoryList: smallCategoryList,
                        ),
                      );
                    },
                    icon: const Icon(Icons.ac_unit)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                TextButton(
                  onPressed: () {
                    _ref.read(bunruiProvider.notifier).setBunrui(bunrui: 'aaaaa');
                  },
                  child: const Text('aaaaa'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                TextButton(
                  onPressed: () {
                    _ref.read(bunruiProvider.notifier).setBunrui(bunrui: 'bbbbb');
                  },
                  child: const Text('bbbbb'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                TextButton(
                  onPressed: () {
                    _ref.read(bunruiProvider.notifier).setBunrui(bunrui: 'ccccc');
                  },
                  child: const Text('ccccc'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ///
  void makeBigCategoryTab() {
    final bigCategoryList = _ref.watch(bigCategoryProvider.select((value) => value.bigCategoryList));

    for (var i = 0; i < bigCategoryList.length; i++) {
      if (bigCategoryList[i].category1 != '' && bigCategoryList[i].category1 != 'null') {
        tabs.add(TabInfo(bigCategoryList[i].category1, CategoryListPage(category1: bigCategoryList[i].category1, scaffoldKey: scaffoldKey)));
      }
    }
  }
}
