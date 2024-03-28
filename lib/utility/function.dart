///
Future<void> onTapGood3(void Function() onSuccess) async {
  await Future.delayed(const Duration(milliseconds: 10));
  onSuccess();
}
