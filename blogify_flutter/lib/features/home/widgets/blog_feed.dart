import 'package:blogify_client/blogify_client.dart';
import 'package:blogify_flutter/core/extensions/context_extension.dart';
import 'package:blogify_flutter/core/theme/app_color.dart';
import 'package:blogify_flutter/core/utils/utils.dart';
import 'package:blogify_flutter/features/home/view/home_page.dart';
import 'package:blogify_flutter/features/home/view/pages/create_blog_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BlogFeed extends StatelessWidget {
  const BlogFeed({super.key, required this.blog});
  final BlogDto blog;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (blog.status == PostStatus.draft) {
          context.push(
            '${HomePage.route}${CreateBlogPage.route}',
            extra: blog,
          );
          return;
        }
        context.push(
          '${HomePage.route}/${blog.id}',
          extra: {
            'blog': blog,
            'preview': false,
          },
        );
      },
      child: Card(
        elevation: 0.5,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 15.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(32.0),
                            child: Image.network(blog.author.profileUrl),
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Expanded(
                          child: Text(
                            blog.author.name,
                            style: context.textTheme.bodyLarge?.copyWith(
                              color: AppColor.blackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '🕰️ ${blog.readingTime} min.',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.blackColor,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                blog.title.trim(),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.headlineSmall?.copyWith(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                  color: AppColor.blackColor.withValues(
                    alpha: 0.95,
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                blog.content.trim(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: AppColor.grey,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Text(
                      '⏰ ${Utils.blogFormatted(blog.createdAt)}',
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Chip(
                      backgroundColor: AppColor.cardBgColor,
                      padding: const EdgeInsets.all(2.0),
                      label: Text(
                        '${blog.category.name} ${blog.category.icon}',
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              Wrap(
                spacing: 4.0,
                children: [
                  ...blog.tags.map(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
