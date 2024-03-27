// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/category.dart';
import '../state/big_category/big_category_notifier.dart';
import '../state/bunrui/bunrui_notifier.dart';
import '../state/small_category/small_category_notifier.dart';
import '../state/video_list/video_list_notifier.dart';
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
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text((bunruiMap[bunrui] != null) ? bunruiMap[bunrui]!['category1']! : ''),
                      Text((bunruiMap[bunrui] != null) ? bunruiMap[bunrui]!['category2']! : ''),
                      Text(bunrui),
                    ],
                  ),
                ),
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
            Divider(color: Colors.white.withOpacity(0.4), thickness: 5),
            Expanded(child: _displayVideoList()),
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

  ///
  Widget _displayVideoList() {
    final list = <Widget>[];

    _ref.watch(videoListProvider.select((value) => value.videoList)).forEach((element) {
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
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3)))),
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
                      GestureDetector(
//                        onTap: () => _ref.watch(appParamProvider.notifier).setYoutubeIdList(youtubeId: data.youtubeId),
                        child: const Icon(Icons.control_point),
                      ),
                      const SizedBox(width: 20),
                      const SizedBox(height: 10),
                      GestureDetector(
//                        onTap: () => _openBrowser(youtubeId: data.youtubeId),
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
