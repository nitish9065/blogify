// ignore_for_file: implementation_imports
import 'package:blogify_client/blogify_client.dart';
import 'package:blogify_flutter/core/extensions/context_extension.dart';
import 'package:blogify_flutter/core/provider/app_state_provider.dart';
import 'package:blogify_flutter/core/provider/client_provider.dart';
import 'package:blogify_flutter/core/theme/app_color.dart';
import 'package:blogify_flutter/features/home/provider/paginated_comment_provider.dart';
import 'package:blogify_flutter/features/home/widgets/comment_card.dart';
import 'package:blogify_flutter/features/home/widgets/comment_post_modal.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:infinite_scroll_pagination/src/widgets/helpers/default_status_indicators/first_page_exception_indicator.dart'
    as no_content_found;

class CommentPage extends ConsumerStatefulWidget {
  const CommentPage({
    super.key,
    required this.blogId,
    required this.authorId,
    required this.refreshBackPage,
    this.parentCommentId,
    this.parentComment,
  });
  final int blogId, authorId;
  final int? parentCommentId;
  final CommentDto? parentComment;
  final VoidCallback refreshBackPage;

  @override
  ConsumerState<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends ConsumerState<CommentPage> {
  late final PaginatedCommentProvider provider;
  late final TextEditingController textEditingController;

  @override
  void initState() {
    if (widget.parentCommentId != null) {
      assert(widget.parentComment != null,
          'Parent comment must be passed when fetching replies.');
    }
    provider = paginatedCommentProvider(widget.blogId, widget.parentCommentId);
    textEditingController = TextEditingController();
    Future.delayed(
      const Duration(seconds: 0),
      () {
        ref
            .read(parentCommentProvider.notifier)
            .updateState(widget.parentComment);
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pagingController = ref.watch(provider.notifier).pagingController;

    return DraggableScrollableSheet(
      expand: false,
      snap: true,
      initialChildSize: .7,
      minChildSize: .4,
      snapSizes: const [.6, 1],
      builder: (context, scrollController) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (widget.parentCommentId != null) ...[
                  IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  )
                ] else ...[
                  const SizedBox(
                    width: 16.0,
                  ),
                ],
                Text(
                  widget.parentCommentId != null ? 'Replies' : 'Responses',
                  style: context.textTheme.headlineSmall,
                ),
              ],
            ),
            Divider(
              thickness: 1,
              color: AppColor.blackColor.withValues(
                alpha: 0.35,
              ),
            ),
            if (widget.parentComment != null) ...[
              Consumer(
                builder: (context, ref, child) {
                  final parentComment = ref.watch(parentCommentProvider);
                  if (parentComment == null) {
                    return const SizedBox.shrink();
                  } else {
                    return ColoredBox(
                      color: AppColor.mainApppurpleColor.withValues(alpha: 0.1),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
                        child: CommentCard(
                          comment: parentComment,
                          blogId: widget.blogId,
                          authorId: widget.authorId,
                          onEditDeleteSuccess: () {
                            context.pop(true);
                            pagingController.refresh();
                            return;
                          },
                          isInReplyPage: true,
                          onEditTap: (currentUser, content, commentId) async {
                            await _makeComment(
                              currentUser: currentUser,
                              refreshPage: () {
                                pagingController.refresh();
                              },
                              content: content,
                              editableCommentId: commentId,
                            );
                          },
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
            Expanded(
              child: PagedListView(
                scrollController: scrollController,
                padding:
                    EdgeInsets.all(widget.parentCommentId != null ? 32.0 : 16.0)
                        .copyWith(
                            bottom: 4.0,
                            top: widget.parentCommentId != null ? 0.0 : null),
                pagingController: pagingController,
                shrinkWrap: true,
                builderDelegate: PagedChildBuilderDelegate<CommentDto>(
                  firstPageProgressIndicatorBuilder: (context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...List.generate(
                          10,
                          (index) => Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            color: AppColor.blackColor.withValues(
                              alpha: 0.15,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                  noItemsFoundIndicatorBuilder: (context) =>
                      no_content_found.FirstPageExceptionIndicator(
                    title: widget.parentCommentId != null
                        ? 'No replies found'
                        : 'No responses found',
                    message: widget.parentCommentId != null
                        ? 'The replies list is currently empty!'
                        : 'The response list is currently empty!',
                  ),
                  itemBuilder: (context, item, index) => CommentCard(
                    isInReplyPage: widget.parentCommentId != null,
                    comment: item,
                    blogId: widget.blogId,
                    authorId: widget.authorId,
                    onEditDeleteSuccess: () {
                      pagingController.refresh();
                      // if (widget.parentCommentId != null) {
                      widget.refreshBackPage.call();
                      // }
                    },
                    onEditTap: (currentUser, content, commentId) async {
                      await _makeComment(
                        currentUser: currentUser,
                        refreshPage: () {
                          pagingController.refresh();
                          widget.refreshBackPage.call();
                        },
                        content: content,
                        editableCommentId: commentId,
                      );
                    },
                  ),
                ),
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                final appState = ref.watch(appFlowStateProvider);
                if (appState is AppStateSuccess) {
                  return GestureDetector(
                    onTap: () => _makeComment(
                      currentUser: appState.user,
                      refreshPage: () {
                        pagingController.refresh();
                      },
                    ),
                    child: Container(
                      color: AppColor.blackColor.withValues(
                        alpha: 0.05,
                      ),
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 15.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(32.0),
                              child: Image.network(appState.user.profileUrl),
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: 4.0, right: 4.0, bottom: 4.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: AppColor.blackColor
                                      .withValues(alpha: 0.15)),
                              padding: const EdgeInsets.all(8.0).copyWith(
                                left: 10.0,
                              ),
                              child: Text(
                                'Add a ${widget.parentCommentId != null ? 'reply' : 'response'}',
                                style: context.textTheme.bodyMedium?.copyWith(
                                  color: AppColor.blackColorFaded,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            )
          ],
        );
      },
    );
  }

  Future<void> _makeComment({
    required UserDto currentUser,
    required VoidCallback refreshPage,
    String? content,
    int? editableCommentId,
  }) async {
    textEditingController.clear();
    if (editableCommentId != null) {
      assert(content != null,
          'when editing content of previous comment must be passed');
      textEditingController.text = content!;
    }
    final shouldUpdatePage = await uploadComment(
      context: context,
      profileUrl: currentUser.profileUrl,
      controller: textEditingController,
      onCommentUploadTap: (content) async {
        if (editableCommentId == null) {
          await ref.read(clientProvider).comment.postComment(
                widget.blogId,
                currentUser.id,
                content,
                widget.parentCommentId,
              );
        } else {
          await ref.read(clientProvider).comment.updateComment(
                content,
                editableCommentId,
              );
          if (editableCommentId == widget.parentCommentId) {
            ref.read(parentCommentProvider.notifier).updateState(
                  widget.parentComment?.copyWith(content: content),
                );
          }
        }
      },
    );
    if (shouldUpdatePage ?? false) {
      refreshPage.call();
      // if (widget.parentCommentId != null) {
      widget.refreshBackPage.call();
      // }
    }
  }
}

class ParentCommentHolder extends StateNotifier<CommentDto?> {
  ParentCommentHolder() : super(null);

  updateState(CommentDto? parent) {
    state = parent;
  }

  display() {
    return state?.toJson();
  }
}

final parentCommentProvider =
    StateNotifierProvider.autoDispose<ParentCommentHolder, CommentDto?>((ref) {
  return ParentCommentHolder();
});
