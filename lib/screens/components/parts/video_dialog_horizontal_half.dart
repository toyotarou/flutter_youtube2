// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../../../extensions/extensions.dart';

Future<void> VideoDialogHorizontalHalf({required BuildContext context, required Widget widget}) {
  return showDialog(
    context: context,
    builder: (_) {
      return Container(
        padding: EdgeInsets.only(
          right: context.screenSize.width * 0.5,
          top: 100,
        ),
        child: Dialog(
          backgroundColor: Colors.blueGrey.withOpacity(0.3),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          insetPadding: const EdgeInsets.all(10),
          child: widget,
        ),
      );
    },
  );
}
