// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blogify_client/blogify_client.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'blog_feed.dart';

class BlogListing extends StatelessWidget {
  const BlogListing({
    super.key,
    required this.blogPagingController,
  });
  final PagingController<int, BlogDto> blogPagingController;

  @override
  Widget build(BuildContext context) {
    return PagedListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      primary: true,
      clipBehavior: Clip.antiAlias,
      pagingController: blogPagingController,
      builderDelegate: PagedChildBuilderDelegate<BlogDto>(
        itemBuilder: (context, blog, index) {
          return BlogFeed(blog: blog);
        },
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 8.0,
      ),
    );
  }
}
