import 'dart:developer';
import 'package:blogify_client/blogify_client.dart';
import 'package:blogify_flutter/core/extensions/context_extension.dart';
import 'package:blogify_flutter/core/provider/app_state_provider.dart';
import 'package:blogify_flutter/core/provider/client_provider.dart';
import 'package:blogify_flutter/core/theme/app_color.dart';
import 'package:blogify_flutter/core/utils/strings.dart';
import 'package:blogify_flutter/core/utils/utils.dart';
import 'package:blogify_flutter/features/home/widgets/comment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentCard extends ConsumerWidget {
  const CommentCard({
    super.key,
    required this.comment,
    required this.blogId,
    required this.authorId,
    required this.onEditDeleteSuccess,
    required this.isInReplyPage,
    this.bgColor = AppColor.transparent,
    required this.onEditTap,
  });
  final bool isInReplyPage;
  final Color? bgColor;
  final CommentDto comment;
  final int blogId, authorId;
  final VoidCallback onEditDeleteSuccess;
  final Future<void> Function(
      UserDto currentUser, String content, int commentId) onEditTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(top: 8.0),
      color: bgColor,
      shape: const RoundedRectangleBorder(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 18.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32.0),
                  child: Image.network(
                    comment.owner.profileUrl.contains('localhost')
                        ? comment.owner.profileUrl.replaceFirst(
                            'localhost',
                            '192.168.1.17',
                          )
                        : comment.owner.profileUrl,
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      comment.owner.name,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      style: context.textTheme.bodyMedium,
                    ),
                    Text(
                      Utils.blogFormatted(
                        comment.updatedAt,
                      ),
                      style: context.textTheme.bodySmall
                          ?.copyWith(color: AppColor.blackColorFaded),
                    )
                  ],
                ),
              ),
              Consumer(
                builder: (context, ref, child) {
                  final appState = ref.watch(appFlowStateProvider);
                  if (appState is AppStateSuccess) {
                    if (appState.user.id == authorId ||
                        appState.user.id == comment.owner.id) {
                      return PopupMenuButton(
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: const Text('Edit'),
                            onTap: () async {
                              await onEditTap(
                                appState.user,
                                comment.content,
                                comment.id,
                              );
                            },
                          ),
                          PopupMenuItem(
                            child: const Text('Delete'),
                            onTap: () async {
                              await ref
                                  .read(clientProvider)
                                  .comment
                                  .deleteComment(comment.id)
                                  .then(
                                (_) {
                                  if (context.mounted) {
                                    context.showSnackBar(
                                        'comment deleted successfully!');
                                  }
                                  onEditDeleteSuccess.call();
                                },
                              ).catchError((e) {
                                if (context.mounted) {
                                  context.showSnackBar(e.toString());
                                }
                              });
                            },
                          ),
                        ],
                        child: const Icon(Icons.more_vert_rounded),
                      );
                    }
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Flexible(
            child: Text(
              maxLines: 4,
              overflow: TextOverflow.fade,
              comment.content,
            ),
          ),
          const SizedBox(
            height: 6.0,
          ),
          if (!isInReplyPage) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () async {
                    if (ref.read(appFlowStateProvider) is! AppStateSuccess) {
                      return;
                    }
                    log('need to move to new dialog to show all the replies for this comment...');
                    final shouldRefresh = await showModalBottomSheet<bool>(
                      showDragHandle: true,
                      isScrollControlled: true,
                      useSafeArea: true,
                      context: context,
                      sheetAnimationStyle: AnimationStyle(
                        reverseCurve: Curves.easeOut,
                      ),
                      builder: (context) {
                        return CustomAnimatedBottomSheet(
                          child: CommentPage(
                            blogId: blogId,
                            authorId: authorId,
                            parentCommentId: comment.id,
                            parentComment: comment,
                            refreshBackPage: () {
                              onEditDeleteSuccess.call();
                            },
                          ),
                        );
                      },
                    );
                    if (shouldRefresh ?? false) {
                      onEditDeleteSuccess.call();
                    }
                  },
                  child: Text(
                    'Replies(${comment.repliesCount}) ${Strings.dot} ${comment.repliesCount != 0 ? 'show replies' : 'make reply'}',
                    style: context.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColor.green,
                    ),
                  ),
                ),
              ],
            ),
          ],
          const Divider(
            color: AppColor.blackColorFaded,
            thickness: .25,
          ),
        ],
      ),
    );
  }
}

// 🎯 Custom Animated Bottom Sheet
class CustomAnimatedBottomSheet extends StatefulWidget {
  @override
  State createState() => _CustomAnimatedBottomSheetState();
  final Widget child;

  const CustomAnimatedBottomSheet({super.key, required this.child});
}

class _CustomAnimatedBottomSheetState extends State<CustomAnimatedBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..forward(); // Start animation when bottom sheet opens

    _slideAnimation = Tween<Offset>(
      begin: const Offset(1, 0), // Start from right
      end: const Offset(0, 0), // Move to normal position
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn, // Smooth transition
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: widget.child,
    );
  }
}
