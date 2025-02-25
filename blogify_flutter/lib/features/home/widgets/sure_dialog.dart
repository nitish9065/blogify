import 'package:blogify_flutter/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<bool> getDialog(
    {required BuildContext context,
    required String title,
    required String content}) async {
  final result = await showDialog<bool>(
    barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          style: TextButton.styleFrom(
            backgroundColor: AppColor.redColor.withValues(alpha: .25),
            foregroundColor: AppColor.redColor,
          ),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            context.pop(true);
          },
          child: const Text('ok'),
        )
      ],
    ),
  );
  return result ?? false;
}
