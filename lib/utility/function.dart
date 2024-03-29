import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../state/video_list/video_list_notifier.dart';

///
Future<void> onTapGood3(void Function() onSuccess) async {
  await Future.delayed(const Duration(milliseconds: 10));
  onSuccess();
}

///
Future<void> openBrowser({required String youtubeId, required WidgetRef ref}) async {
  await ref.read(videoListProvider.notifier).updateVideoPlayedAt(youtubeId: youtubeId);

  final url = Uri.parse('https://youtu.be/$youtubeId');
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}
