import 'package:blogify_flutter/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentTextfield extends ConsumerStatefulWidget {
  const CommentTextfield(this.controller, {super.key});
  final TextEditingController controller;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CommentTextfieldState();
}

class _CommentTextfieldState extends ConsumerState<CommentTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.bottom,
      controller: widget.controller,
      cursorColor: AppColor.mainApppurpleColor,
      minLines: 1,
      maxLines: 4,
      scrollPadding: const EdgeInsets.all(4.0),
      style: TextStyle(
        color: AppColor.blackColor.withValues(
          alpha: 0.85,
        ),
      ),
      decoration: InputDecoration(
        isDense: true,
        fillColor: AppColor.whiteColor,
        contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: const BorderSide(
            color: AppColor.blackColor,
            width: 0.75,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: const BorderSide(
            color: AppColor.blackColor,
            width: 0.75,
          ),
        ),
        hintText: 'What are your thoughts?',
      ),
    );
  }
}
