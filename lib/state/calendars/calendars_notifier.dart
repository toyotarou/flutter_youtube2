import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';

import 'calendars_response_state.dart';

////////////////////////////////////////////////

final calendarProvider = StateNotifierProvider.autoDispose<CalendarNotifier, CalendarsResponseState>((ref) {
  final baseYm = DateTime.now();
  final prevYM = DateTime(baseYm.year, baseYm.month - 1);
  final nextYM = DateTime(baseYm.year, baseYm.month + 1);
  return CalendarNotifier(CalendarsResponseState(baseYearMonth: baseYm.yyyymm, prevYearMonth: prevYM.yyyymm, nextYearMonth: nextYM.yyyymm));
});

class CalendarNotifier extends StateNotifier<CalendarsResponseState> {
  CalendarNotifier(super.state);

  ///
  Future<void> setPrevYearMonth() async {
    final baseYm = DateTime(DateTime.parse('${state.baseYearMonth}-01 00:00:00').year, DateTime.parse('${state.baseYearMonth}-01 00:00:00').month - 1);
    final prevYM = DateTime(baseYm.year, baseYm.month - 1);
    final nextYM = DateTime(baseYm.year, baseYm.month + 1);
    state = state.copyWith(baseYearMonth: baseYm.yyyymm, prevYearMonth: prevYM.yyyymm, nextYearMonth: nextYM.yyyymm);
  }

  ///
  Future<void> setNextYearMonth() async {
    final baseYm = DateTime(DateTime.parse('${state.baseYearMonth}-01 00:00:00').year, DateTime.parse('${state.baseYearMonth}-01 00:00:00').month + 1);
    final prevYM = DateTime(baseYm.year, baseYm.month - 1);
    final nextYM = DateTime(baseYm.year, baseYm.month + 1);
    state = state.copyWith(baseYearMonth: baseYm.yyyymm, prevYearMonth: prevYM.yyyymm, nextYearMonth: nextYM.yyyymm);
  }
}

////////////////////////////////////////////////
