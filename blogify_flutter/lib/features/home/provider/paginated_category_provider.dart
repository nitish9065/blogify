import 'package:blogify_client/blogify_client.dart';
import 'package:blogify_flutter/core/provider/client_provider.dart';
import 'package:blogify_flutter/features/home/provider/selected_category_provider.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'paginated_category_provider.g.dart';

@Riverpod(keepAlive: true)
class PaginatedCategory extends _$PaginatedCategory {
  final PagingController<int, CategoryDto> pagingController =
      PagingController(firstPageKey: 1);

  @override
  PagingStatus build() {
    pagingController.addPageRequestListener(
      (pageKey) {
        print('Next fetch requested fro page $pageKey');
        _fetchPage(pageKey);
      },
    );
    pagingController.addStatusListener(
      (status) {
        state = status;
      },
    );

    return PagingStatus.loadingFirstPage;
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final data =
          await ref.read(clientProvider).category.getCategory(20, pageKey);
      if (data.hasMore) {
        pagingController.appendPage(data.categories, pageKey + 1);
      } else {
        pagingController.appendLastPage(data.categories);
      }
      if (pageKey == 1) {
        bool haveSomething = data.categories.isNotEmpty;
        if (haveSomething) {
          ref
              .read(selectedCategoryProvider.notifier)
              .selectCategory(data.categories.first);
        }
      }
    } catch (e) {
      print('Error occured while paginating categories.. ${e.toString()}');
    }
  }

  void refresh() {
    pagingController.refresh();
  }
}
