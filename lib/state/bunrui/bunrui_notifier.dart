import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'bunrui_response_state.dart';

final bunruiProvider = StateNotifierProvider.autoDispose<BunruiNotifier, BunruiResponseState>((ref) {
  return BunruiNotifier(const BunruiResponseState());
});

class BunruiNotifier extends StateNotifier<BunruiResponseState> {
  BunruiNotifier(super.state);

  ///
  Future<void> setBunrui({required String bunrui}) async {
    state = state.copyWith(bunrui: bunrui);
  }
}
