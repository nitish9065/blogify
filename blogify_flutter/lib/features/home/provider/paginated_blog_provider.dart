import 'dart:developer';

import 'package:blogify_client/blogify_client.dart';
import 'package:blogify_flutter/core/provider/client_provider.dart';
import 'package:blogify_flutter/features/home/provider/paginated_category_provider.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'paginated_blog_provider.g.dart';

@Riverpod(keepAlive: true)
class PaginatedBlog extends _$PaginatedBlog {
  final PagingController<int, BlogDto> pagingController =
      PagingController(firstPageKey: 1);

  @override
  PagingStatus build({int? categoryId, int? userId, PostStatus? status}) {
    pagingController.addStatusListener(
      (status) {
        state = status;
      },
    );

    pagingController.addPageRequestListener(
      (pageKey) {
        _fetchBlog(pageKey);
      },
    );

    return PagingStatus.loadingFirstPage;
  }

  Future<void> _fetchBlog(int pageKey) async {
    try {
      final data = await ref.read(clientProvider).blog.paginateBlogs(
            page: pageKey,
            limit: 20,
            categoryId: categoryId ?? 0,
            userId: userId ?? 0,
            status: status,
          );
      if (data.hasMore) {
        pagingController.appendPage(data.blogs, pageKey + 1);
      } else {
        pagingController.appendLastPage(data.blogs);
      }
    } catch (e) {
      log('Error occured while fetchin blog in home page with error ${e.toString()}');
    }
  }

  void internalRefresh() {
    pagingController.refresh();
  }

  void refreshHome() {
    internalRefresh();
    ref.read(paginatedCategoryProvider.notifier).refresh();
  }
}
