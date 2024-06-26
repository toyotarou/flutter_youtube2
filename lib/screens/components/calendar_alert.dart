// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';
import '../../models/video.dart';
import '../../state/calendars/calendars_notifier.dart';
import '../../state/holidays/holiday_notifier.dart';
import '../../state/video_list/video_list_notifier.dart';
import '../../utility/utility.dart';
import 'get_publish_video_list_alert.dart';
import 'parts/video_dialog.dart';

class CalendarAlert extends ConsumerWidget {
  CalendarAlert({super.key, required this.type});

  final String type;

  DateTime _calendarMonthFirst = DateTime.now();
  final List<String> _youbiList = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
  List<String> _calendarDays = [];

  final Utility _utility = Utility();

  Map<String, List<Video>> calendarMap = {};

  late BuildContext _context;
  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    makeCalendarMap();

    final calendarState = ref.watch(calendarProvider);

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
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(color: Colors.blueGrey.withOpacity(0.2), borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            ref.read(calendarProvider.notifier).setPrevYearMonth();
                          },
                          icon: Icon(Icons.arrow_back_ios, color: Colors.white.withOpacity(0.8), size: 14),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          child: Text(calendarState.baseYearMonth),
                        ),
                        IconButton(
                          onPressed: () {
                            ref.read(calendarProvider.notifier).setNextYearMonth();
                          },
                          icon: Icon(Icons.arrow_forward_ios, color: Colors.white.withOpacity(0.8), size: 14),
                        ),
                      ],
                    ),
                    Text(type),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              ConstrainedBox(
                constraints: BoxConstraints(minHeight: context.screenSize.height * 0.45),
                child: _getCalendar(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget _getCalendar() {
    final calendarState = _ref.watch(calendarProvider);

    _calendarMonthFirst = DateTime.parse('${calendarState.baseYearMonth}-01 00:00:00');

    final monthEnd = DateTime.parse('${calendarState.nextYearMonth}-00 00:00:00');

    final diff = monthEnd.difference(_calendarMonthFirst).inDays;
    final monthDaysNum = diff + 1;

    final youbi = _calendarMonthFirst.youbiStr;
    final youbiNum = _youbiList.indexWhere((element) => element == youbi);

    final weekNum = ((monthDaysNum + youbiNum) <= 35) ? 5 : 6;

    _calendarDays = List.generate(weekNum * 7, (index) => '');

    for (var i = 0; i < (weekNum * 7); i++) {
      if (i >= youbiNum) {
        final gendate = _calendarMonthFirst.add(Duration(days: i - youbiNum));

        if (_calendarMonthFirst.month == gendate.month) {
          _calendarDays[i] = gendate.day.toString();
        }
      }
    }

    final list = <Widget>[];
    for (var i = 0; i < weekNum; i++) {
      list.add(_getCalendarRow(week: i));
    }

    return DefaultTextStyle(style: const TextStyle(fontSize: 10), child: Column(children: list));
  }

  ///
  Widget _getCalendarRow({required int week}) {
    final holidayState = _ref.watch(holidayProvider);

    final list = <Widget>[];

    for (var i = week * 7; i < ((week + 1) * 7); i++) {
      final generateYmd =
          (_calendarDays[i] == '') ? '' : DateTime(_calendarMonthFirst.year, _calendarMonthFirst.month, _calendarDays[i].toInt()).yyyymmdd;

      final youbiStr =
          (_calendarDays[i] == '') ? '' : DateTime(_calendarMonthFirst.year, _calendarMonthFirst.month, _calendarDays[i].toInt()).youbiStr;

      list.add(
        Expanded(
          child: GestureDetector(
            // onTap: (_calendarDays[i] == '' || dateDiff > 0)
            //     ? null
            //     : () => MoneyDialog(
            //           context: context,
            //           widget: DailyMoneyDisplayAlert(date: DateTime.parse('$generateYmd 00:00:00'), isar: widget.isar, moneyMap: moneyMap),
            //         ),

            onTap: (_calendarDays[i] == '')
                ? null
                : (calendarMap[generateYmd] == null)
                    ? null
                    : () {
                        VideoDialog(
                          context: _context,
                          widget: GetPublishVideoListAlert(
                              type: type, date: DateTime.parse('$generateYmd 00:00:00'), videoList: calendarMap[generateYmd]),
                        );
                      },

            child: Container(
              margin: const EdgeInsets.all(1),
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                border: Border.all(
                  color: (_calendarDays[i] == '')
                      ? Colors.transparent
                      : (generateYmd == DateTime.now().yyyymmdd)
                          ? Colors.orangeAccent.withOpacity(0.4)
                          : Colors.white.withOpacity(0.1),
                  width: 3,
                ),
                color: (_calendarDays[i] == '')
                    ? Colors.transparent
                    : _utility.getYoubiColor(
                        date: DateTime(_calendarMonthFirst.year, _calendarMonthFirst.month, _calendarDays[i].toInt()),
                        youbiStr: youbiStr,
                        holiday: holidayState.data),
              ),
              child: (_calendarDays[i] == '')
                  ? const Text('')
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_calendarDays[i].padLeft(2, '0')),
                          ],
                        ),
                        const SizedBox(height: 5),
                        ConstrainedBox(
                          constraints: BoxConstraints(minHeight: _context.screenSize.height / 25),
                          child: Column(
                            children: [
                              Text((calendarMap[generateYmd] != null) ? calendarMap[generateYmd]!.length.toString() : ''),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      );
    }

    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: list);
  }

  ///
  void makeCalendarMap() {
    final videoList = _ref.watch(videoListProvider.select((value) => value.videoList));

    if (type == 'get') {
      videoList
        ..forEach((element) {
          var getdate = '';

          if (element.getdate != 'null') {
            final year = element.getdate.substring(0, 4);
            final month = element.getdate.substring(4, 6);
            final day = element.getdate.substring(6);
            getdate = '$year-$month-$day';
          }

          calendarMap[getdate] = [];
        })
        ..forEach((element) {
          var getdate = '';

          if (element.getdate != 'null') {
            final year = element.getdate.substring(0, 4);
            final month = element.getdate.substring(4, 6);
            final day = element.getdate.substring(6);
            getdate = '$year-$month-$day';
          }

          calendarMap[getdate]?.add(element);
        });
    }

    if (type == 'publish') {
      videoList
        ..forEach((element) {
          calendarMap[element.pubdate] = [];
        })
        ..forEach((element) {
          calendarMap[element.pubdate]?.add(element);
        });
    }
  }
}
