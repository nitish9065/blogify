import 'package:blogify_flutter/core/extensions/context_extension.dart';
import 'package:blogify_flutter/core/utils/strings.dart';
import 'package:blogify_flutter/features/home/widgets/comment_textfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<bool?> uploadComment({
  required BuildContext context,
  required String profileUrl,
  required TextEditingController controller,
  required Function(String content) onCommentUploadTap,
}) async {
  final shouldUpdatePage = await showModalBottomSheet<bool>(
    context: context,
    builder: (context) {
      return Material(
        child: Container(
          padding: const EdgeInsets.all(8.0).copyWith(
            bottom: context.bottomPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 15.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        32.0,
                      ),
                      child: Image.network(
                        profileUrl,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: CommentTextfield(
                      controller,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      if (controller.text.isEmpty) {
                        context.showSnackBar('comment can not be empty!');
                        return;
                      }
                      try {
                        await onCommentUploadTap(controller.text.trim());
                      } catch (e) {
                        if (context.mounted) {
                          context
                              .showSnackBar('Failed to put a response to blog');
                          context.pop(false);
                        }
                        return;
                      } finally {
                        controller.clear();
                      }
                      context.pop(true);
                      return;
                    },
                    icon: const Icon(
                      Icons.send,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 4.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8.0,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    Strings.commentsEmojis.length,
                    (index) => InkWell(
                      onTap: () {
                        controller.text =
                            controller.text + Strings.commentsEmojis[index];
                      },
                      child: Text(
                        Strings.commentsEmojis[index],
                        style: context.textTheme.headlineMedium,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
            ],
          ),
        ),
      );
    },
  );
  return shouldUpdatePage;
}
