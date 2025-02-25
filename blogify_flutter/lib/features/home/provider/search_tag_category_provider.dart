import 'package:blogify_client/blogify_client.dart';
import 'package:blogify_flutter/core/provider/client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tagSearchProvider =
    FutureProvider.family.autoDispose<List<TagDto>, String>(
  (ref, String query) async {
    final repo = ref.read(clientProvider).tag;
    return repo.searchTags(query);
  },
);
final categorySearchProvider =
    FutureProvider.family.autoDispose<List<CategoryDto>, String>(
  (ref, String query) async {
    final repo = ref.read(clientProvider).category;
    return repo.searchCategories(query);
  },
);

final searchCategoryQueryProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});

final searchTagQueryProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});
