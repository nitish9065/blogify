import 'package:blogify_client/blogify_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedCategory extends StateNotifier<CategoryDto?> {
  SelectedCategory() : super(null);

  void selectCategory(CategoryDto category) {
    state = category;
  }

  void removeSelected() {
    state = null;
  }

  bool get isSelected => state != null;
}

final selectedCategoryProvider =
    StateNotifierProvider<SelectedCategory, CategoryDto?>(
  (ref) => SelectedCategory(),
);
