import 'package:blogify_client/blogify_client.dart';
import 'package:blogify_flutter/core/extensions/context_extension.dart';
import 'package:blogify_flutter/core/theme/app_color.dart';
import 'package:blogify_flutter/core/widgets/app_scaffold.dart';
import 'package:blogify_flutter/features/home/models/user_blog_parameters.dart';
import 'package:blogify_flutter/features/home/provider/paginated_blog_provider.dart';
import 'package:blogify_flutter/features/home/view/account_page.dart';
import 'package:blogify_flutter/features/home/widgets/blog_listing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserBlogPage extends ConsumerWidget {
  const UserBlogPage({
    super.key,
    required this.userId,
    required this.params,
  });
  final int userId;
  final UserBlogParameters params;

  static String route({int? id}) => "${AccountPage.route}/${id ?? ':id'}/blogs";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blogPagingController = ref
        .watch(paginatedBlogProvider(
          userId: userId,
          status: params.status,
        ).notifier)
        .pagingController;
    return AppScaffold(
      appBar: AppBar(
        title: Text(
          "${params.userName.split(' ').first}'s ${params.status == PostStatus.published ? 'Blogs' : params.status == PostStatus.draft ? 'Drafts' : 'Scheduled'}",
          style: context.textTheme.headlineSmall?.copyWith(
            color: AppColor.whiteColor,
          ),
        ),
        centerTitle: false,
      ),
      body: BlogListing(blogPagingController: blogPagingController),
    );
  }
}
