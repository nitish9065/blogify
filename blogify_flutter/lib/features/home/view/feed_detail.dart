// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:blogify_client/blogify_client.dart';
import 'package:blogify_flutter/core/extensions/context_extension.dart';
import 'package:blogify_flutter/core/extensions/num_duration_extension.dart';
import 'package:blogify_flutter/core/provider/app_state_provider.dart';
import 'package:blogify_flutter/core/provider/client_provider.dart';
import 'package:blogify_flutter/core/provider/loader.dart';
import 'package:blogify_flutter/core/theme/app_color.dart';
import 'package:blogify_flutter/core/utils/strings.dart';
import 'package:blogify_flutter/core/utils/utils.dart';
import 'package:blogify_flutter/features/auth/auth_page.dart';
import 'package:blogify_flutter/features/home/provider/comment_count_stream_provider.dart';
import 'package:blogify_flutter/features/home/provider/paginated_blog_provider.dart';
import 'package:blogify_flutter/features/home/provider/paginated_comment_provider.dart';
import 'package:blogify_flutter/features/home/provider/user_stats_provider.dart';
import 'package:blogify_flutter/features/home/view/home_page.dart';
import 'package:blogify_flutter/features/home/view/pages/create_blog_page.dart';
import 'package:blogify_flutter/features/home/widgets/comment_card.dart';
import 'package:blogify_flutter/features/home/widgets/comment_page.dart';
import 'package:blogify_flutter/features/home/widgets/comment_post_modal.dart';
import 'package:blogify_flutter/features/home/widgets/sure_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:blogify_flutter/core/widgets/app_constrained_scroll_view.dart';
import 'package:blogify_flutter/core/widgets/app_scaffold.dart';
import 'package:go_router/go_router.dart';

class FeedDetail extends ConsumerStatefulWidget {
  const FeedDetail({
    super.key,
    required this.blogId,
    required this.blog,
    required this.forPreview,
  });
  final int blogId;
  final BlogDto blog;
  final bool forPreview;

  @override
  ConsumerState<FeedDetail> createState() => _FeedDetailState();
}

class _FeedDetailState extends ConsumerState<FeedDetail> {
  late PaginatedCommentArgs args;
  late final AutoDisposeFutureProvider<PaginatedComments> provider;
  late final TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    args = PaginatedCommentArgs(1, 4, widget.blogId, null);
    provider = fetchInitialCommentsProvider(args);
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        actions: [
          if (!widget.forPreview) ...[
            IconButton(
              onPressed: () {},
              tooltip: 'Tap to listen by AI',
              icon: const Icon(
                Icons.play_circle_outline_outlined,
              ),
            ),
            IconButton(
              onPressed: () {},
              tooltip: 'Tap to share the article',
              icon: const Icon(
                Icons.share_outlined,
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                final currentUserState = ref.watch(appFlowStateProvider);
                if (currentUserState is AppStateSuccess &&
                    widget.blog.author.id == currentUserState.user.id) {
                  return PopupMenuButton(
                    offset: const Offset(-24, kToolbarHeight / 1.35),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: const Text('Edit'),
                        onTap: () {
                          context.push(
                            '${HomePage.route}${CreateBlogPage.route}',
                            extra: widget.blog,
                          );
                          return;
                        },
                      ),
                      PopupMenuItem(
                        child: const Text('Delete'),
                        onTap: () async {
                          final shouldDelete = await getDialog(
                            context: context,
                            title: 'Do you want to delete this blog?',
                            content:
                                'Once deleted you will not be able to access this!',
                          );
                          if (shouldDelete) {
                            try {
                              ref.read(loaderProvider.notifier).showLoader();
                              await ref
                                  .read(clientProvider)
                                  .blog
                                  .deleteBlog(widget.blogId);
                              context
                                  .showSnackBar('Blog deleted successfully!');
                              if (widget.blog.status == PostStatus.published) {
                                ref.invalidate(
                                  userStatsProvider(currentUserState.user.id),
                                );
                              }
                              ref
                                  .read(paginatedBlogProvider(categoryId: null)
                                      .notifier)
                                  .refreshHome();
                              context.go(HomePage.route);
                            } catch (e) {
                              context.showSnackBar(e.toString());
                            } finally {
                              ref.read(loaderProvider.notifier).hideLoader();
                            }
                            /*


                            */
                          }
                        },
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            )
          ] else ...[
            PopupMenuButton<PostStatus>(
              // offset: const Offset(-4, kToolbarHeight / 1.35),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: PostStatus.draft,
                  child: Text('Save as Draft'),
                ),
                const PopupMenuItem(
                  value: PostStatus.published,
                  child: Text('Upload'),
                ),
              ],
              onSelected: (status) async {
                try {
                  ref.read(loaderProvider.notifier).showLoader();
                  final newBlog = CreateBlogDto(
                    id: widget.blog.id,
                    title: widget.blog.title,
                    content: widget.blog.content,
                    categoryId: widget.blog.category.id,
                    tags: widget.blog.tags
                        .map(
                          (e) => e.id,
                        )
                        .toList(),
                    status: status,
                    userId: widget.blog.author.id,
                  );
                  await ref.read(clientProvider).blog.uploadBlog(newBlog);
                  context.showSnackBar('Successfully created a new blog!');
                  ref
                      .read(paginatedBlogProvider(categoryId: null).notifier)
                      .refreshHome();
                  ref.invalidate(userStatsProvider(widget.blog.author.id));
                  context.go(HomePage.route);
                } catch (e) {
                  context.showSnackBar(e.toString());
                } finally {
                  ref.read(loaderProvider.notifier).hideLoader();
                }
              },
              child: const Icon(Icons.upload),
            ),
            const SizedBox(
              width: 16.0,
            )
          ]
        ],
      ),
      body: AppConstrainedScrollView(
        padding: const EdgeInsets.all(16.0),
        withScrollBar: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                widget.blog.title.trim(),
                style: context.textTheme.headlineLarge,
              ),
            ),
            Divider(
              thickness: 1,
              color: AppColor.blackColor.withValues(
                alpha: 0.5,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              isThreeLine: true,
              horizontalTitleGap: 10.0,
              leading: CircleAvatar(
                radius: 28.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32.0),
                  child: Image.network(widget.blog.author.profileUrl),
                ),
              ),
              title: Text(
                widget.blog.author.name,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: AppColor.blackColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${widget.forPreview ? 'Created' : 'Published'} on ${Utils.blogFormatted(widget.blog.createdAt)}',
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColor.blackColorFaded,
                    ),
                  ),
                  if (!widget.forPreview)
                    Text(
                      '${widget.blog.readingTime} minutes read time',
                      style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500, color: AppColor.green),
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            IntrinsicHeight(
              child: Text(
                widget.blog.content.trim(),
                style: context.textTheme.bodyLarge?.copyWith(
                  color: AppColor.blackColor.withValues(
                    alpha: 0.9,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Divider(
              thickness: 1,
              color: AppColor.blackColor.withValues(
                alpha: 0.25,
              ),
            ),
            Chip(
              backgroundColor: AppColor.cardBgColor,
              padding: const EdgeInsets.all(4.0),
              label: Text(
                '${widget.blog.category.name} ${widget.blog.category.icon}',
              ),
            ),
            Wrap(
              spacing: 4.0,
              children: [
                ...widget.blog.tags.map(
                  (e) => Chip(
                    backgroundColor: AppColor.stackBackgroundColor.withValues(
                      alpha: 0.75,
                    ),
                    padding: const EdgeInsets.all(2.0),
                    label: Text(
                      '🏷️ ${e.name}',
                      style: const TextStyle(color: AppColor.backgroundColor),
                    ),
                  ),
                )
              ],
            ),
            Divider(
              thickness: 1,
              color: AppColor.blackColor.withValues(
                alpha: 0.25,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              isThreeLine: true,
              horizontalTitleGap: 10.0,
              leading: CircleAvatar(
                radius: 26.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32.0),
                  child: Image.network(widget.blog.author.profileUrl),
                ),
              ),
              title: Text(
                widget.blog.author.name,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: AppColor.blackColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Consumer(
                builder: (context, ref, child) =>
                    ref.watch(userStatsProvider(widget.blog.author.id)).when(
                          data: (data) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${data.followersCount.compact} Followers ${Strings.dot} ${data.followingCount.compact} Following',
                                style: context.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.blackColorFaded,
                                ),
                              ),
                              Text(
                                'Total ${data.blogCount} blogs written',
                                style: context.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.blackColorFaded,
                                ),
                              ),
                            ],
                          ),
                          error: (error, stackTrace) {
                            return SizedBox.fromSize();
                          },
                          loading: () => const SizedBox.shrink(),
                        ),
              ),
              trailing: Consumer(
                builder: (context, ref, child) {
                  final appState = ref.watch(appFlowStateProvider);
                  if (appState is AppStateSuccess) {
                    if (appState.user.id == widget.blog.author.id) {
                      return const Text(
                        '😴',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      );
                    }
                    return TextButton(
                      style: Theme.of(context).textButtonTheme.style?.copyWith(
                            padding: const WidgetStatePropertyAll(
                              EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 10.0),
                            ),
                          ),
                      onPressed: () async {
                        await ref.read(clientProvider).user.followUnfollowUser(
                            appState.user.id, widget.blog.author.id);
                      },
                      child: ref
                          .watch(userFollowingStatusProvider(
                              widget.blog.author.id))
                          .when(
                            data: (data) {
                              return Text(
                                data.isFollowing ? 'Following' : 'Follow',
                              );
                            },
                            error: (error, stackTrace) {
                              return const Text('UNKNOWN');
                            },
                            loading: () => const SizedBox.shrink(),
                          ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            const SizedBox(
              height: 32.0,
            ),
            Consumer(
              builder: (context, ref, child) =>
                  ref.watch(commentCountProvider(widget.blog.id)).when(
                        data: (data) => Text(
                          'Responses ($data)',
                          style: context.textTheme.headlineSmall,
                        ),
                        error: (error, stackTrace) => Text(
                          'Responses (ERROR)',
                          style: context.textTheme.headlineSmall,
                        ),
                        loading: () => Text(
                          'Responses (Loading...)',
                          style: context.textTheme.headlineSmall,
                        ),
                      ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Consumer(
              builder: (context, ref, child) {
                final appState = ref.watch(appFlowStateProvider);
                if (appState is AppStateSuccess) {
                  return ListTile(
                    onTap: widget.forPreview
                        ? null
                        : () => _makeComment(
                              user: appState.user,
                              parentCommentId: null,
                            ),
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      radius: 18.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(32.0),
                        child: Image.network(appState.user.profileUrl),
                      ),
                    ),
                    title: Text(
                      appState.user.name,
                    ),
                    subtitle: Container(
                      margin: const EdgeInsets.only(top: 4.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: AppColor.blackColor.withValues(alpha: 0.15)),
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'What are your thoughts?',
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: AppColor.blackColorFaded,
                        ),
                      ),
                    ),
                  );
                }
                return ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  tileColor: AppColor.blackColor.withValues(alpha: 0.05),
                  leading: const CircleAvatar(
                    radius: 18.0,
                    child: Icon(
                      Icons.person,
                      size: 32,
                    ),
                  ),
                  title: Text(
                    'Wanna share your thoughts',
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: AppColor.blackColor.withValues(alpha: 0.7),
                    ),
                  ),
                  trailing: TextButton(
                    onPressed: () async {
                      await context.push(AuthPage.route);
                      final appstate = ref.read(appFlowStateProvider);
                      if (appstate is AppStateSuccess) {
                        log('should go to comment modal bottom sheet!!');
                      } else {
                        log('Signed user got null');
                      }
                    },
                    child: const Text(
                      'Login Now',
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 24.0,
            ),
            // Generating the comments for the blog...

            ref.watch(provider).when(
                  data: (data) {
                    final items = data.comments;
                    if (items.isEmpty) {
                      return const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(child: Text('No Comments Found!')),
                          SizedBox(
                            height: 16.0,
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ...items.map(
                            (comment) => CommentCard(
                              comment: comment,
                              blogId: widget.blogId,
                              authorId: widget.blog.author.id,
                              isInReplyPage: false,
                              onEditDeleteSuccess: () =>
                                  ref.invalidate(provider),
                              onEditTap:
                                  (currentUser, content, commentId) async {
                                _makeComment(
                                  user: currentUser,
                                  editableCommentId: commentId,
                                  comment: content,
                                );
                              },
                            ),
                          )
                        ],
                      );
                    }
                  },
                  error: (error, stackTrace) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: Text(
                            error.toString(),
                          ),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                      ],
                    );
                  },
                  loading: () => Center(
                    child: CircularProgressIndicator(
                      color: AppColor.mainApppurpleColor,
                    ),
                  ),
                ),
            // Now show button to get all the response....
            Align(
              child: TextButton(
                  onPressed: widget.forPreview
                      ? null
                      : () async {
                          await showModalBottomSheet<bool>(
                            showDragHandle: true,
                            isScrollControlled: true,
                            useSafeArea: true,
                            context: context,
                            builder: (context) {
                              return CommentPage(
                                blogId: widget.blogId,
                                authorId: widget.blog.author.id,
                                refreshBackPage: () => ref.invalidate(provider),
                              );
                            },
                          );
                        },
                  child: const Text('Show All Responses')),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _makeComment({
    required UserDto user,
    int? parentCommentId,
    String? comment,
    int? editableCommentId,
  }) async {
    textEditingController.clear();
    if (editableCommentId != null) {
      assert(comment != null,
          'when editing content of previous comment must be passed');
      textEditingController.text = comment!;
    }
    final shouldUpdatePage = await uploadComment(
      context: context,
      profileUrl: user.profileUrl,
      controller: textEditingController,
      onCommentUploadTap: (content) async {
        if (editableCommentId == null) {
          await ref.read(clientProvider).comment.postComment(
                widget.blogId,
                user.id,
                content,
                parentCommentId,
              );
        } else {
          await ref.read(clientProvider).comment.updateComment(
                content,
                editableCommentId,
              );
        }
      },
    );
    if (shouldUpdatePage ?? false) {
      ref.invalidate(provider);
    }
  }
}
