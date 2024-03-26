import 'package:freezed_annotation/freezed_annotation.dart';

part 'bunrui_response_state.freezed.dart';

@freezed
class BunruiResponseState with _$BunruiResponseState {
  const factory BunruiResponseState({
    @Default('') String bunrui,
  }) = _BunruiResponseState;
}
