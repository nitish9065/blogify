import 'dart:developer';

import 'package:blogify_client/blogify_client.dart';
import 'package:blogify_flutter/core/provider/client_provider.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'paginated_tag_provider.g.dart';

@riverpod
class PaginatedTag extends _$PaginatedTag {
  final PagingController<int, TagDto> pagingController =
      PagingController(firstPageKey: 1);
  @override
  PagingStatus build() {
    pagingController.addPageRequestListener(
      (pageKey) {
        log('tags fetching for page $pageKey');
        _fetchPage(pageKey);
      },
    );
    pagingController.addStatusListener(
      (status) {
        log('paging status while getting tags from server is $status');
        state = status;
      },
    );
    return PagingStatus.loadingFirstPage;
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final data = await ref.read(clientProvider).tag.paginateTags(20, pageKey);
      log('tags recieved from server on page no $pageKey is ${data.tags.length} & total copunt is ${data.totalCount}');
      if (data.hasMore) {
        pagingController.appendPage(data.tags, pageKey + 1);
      } else {
        pagingController.appendLastPage(data.tags);
      }
    } catch (e) {
      log('Error occured while paginating tags.. ${e.toString()}');
    }
  }

  void refresh() {
    pagingController.refresh();
  }
}
