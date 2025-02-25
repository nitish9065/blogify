import 'package:blogify_client/blogify_client.dart';
import 'package:blogify_flutter/features/home/widgets/sure_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:blogify_flutter/core/extensions/context_extension.dart';
import 'package:blogify_flutter/core/provider/app_state_provider.dart';
import 'package:blogify_flutter/core/provider/client_provider.dart';
import 'package:blogify_flutter/core/provider/loader.dart';
import 'package:blogify_flutter/core/theme/app_color.dart';
import 'package:blogify_flutter/core/widgets/app_constrained_scroll_view.dart';
import 'package:blogify_flutter/core/widgets/app_scaffold.dart';
import 'package:blogify_flutter/core/widgets/throttler.dart';
import 'package:blogify_flutter/features/home/models/empty_category_feed.dart';
import 'package:blogify_flutter/features/home/models/empty_tag_feed.dart';
import 'package:blogify_flutter/features/home/provider/paginated_category_provider.dart';
import 'package:blogify_flutter/features/home/provider/paginated_tag_provider.dart';
import 'package:blogify_flutter/features/home/provider/search_tag_category_provider.dart';
import 'package:blogify_flutter/features/home/view/home_page.dart';

class CreateBlogPage extends ConsumerStatefulWidget {
  const CreateBlogPage({
    super.key,
    this.blog,
  });

  static String get route => '/create';

  final BlogDto? blog;

  @override
  ConsumerState<CreateBlogPage> createState() => _CreateBlogPageState();
}

class _CreateBlogPageState extends ConsumerState<CreateBlogPage> {
  late final TextEditingController titleController;
  late final TextEditingController bodyController;
  late final Throttler _throttler;

  final GlobalKey<AutoTextFieldState> customKey = GlobalKey();
  final GlobalKey<AutoTextFieldState> customKey2 = GlobalKey();

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    bodyController = TextEditingController();
    _throttler = Throttler();
    init();
  }

  void init() {
    if (widget.blog != null) {
      Future.delayed(
        const Duration(seconds: 0),
        () {
          titleController.text = widget.blog!.title;
          bodyController.text = widget.blog!.content;
          ref.read(blogSelectedCategoryProvider.notifier).update(
                (state) => widget.blog!.category,
              );
          ref.read(selectedTagsProvider.notifier).init(widget.blog!.tags);
        },
      );
    }
  }

  @override
  void dispose() {
    _throttler.dispose();
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: (titleController.text.trim().isNotEmpty ||
              bodyController.text.trim().isNotEmpty)
          ? false
          : true,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          final shouldPop = await getDialog(
              context: context,
              title: 'Do you want to go back?',
              content: 'Changes you made will be lost once you go back!');

          if (shouldPop) {
            context.pop();
          }
        }
      },
      child: AppScaffold(
        appBar: AppBar(
          title: const Text('Create Blog'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                if (ref.read(blogSelectedCategoryProvider) == null) {
                  context.showSnackBar('select blog category first!');
                  return;
                }
                context.push(
                  '${HomePage.route}/${widget.blog?.id ?? 0}',
                  extra: {
                    'blog': BlogDto(
                      id: widget.blog?.id ?? 0,
                      title: titleController.text,
                      content: bodyController.text,
                      author:
                          (ref.read(appFlowStateProvider) as AppStateSuccess)
                              .user,
                      tags: ref.read(selectedTagsProvider),
                      category: ref.read(blogSelectedCategoryProvider)!,
                      readingTime: 0,
                      createdAt: DateTime.now(),
                      updatedAt: DateTime.now(),
                      status: PostStatus.draft,
                    ),
                    'preview': true,
                  },
                );
              },
              iconSize: 30.0,
              icon: const Icon(
                Icons.preview_rounded,
              ),
            )
          ],
        ),
        releaseFocus: true,
        body: AppConstrainedScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Column(
            spacing: 10.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: titleController,
                minLines: 1,
                maxLines: 5,
                cursorHeight: 24.0,
                cursorColor: AppColor.primary,
                style: context.textTheme.headlineMedium,
                // scrollPadding: const EdgeInsets.all(12.0),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                    bottom: 16.0,
                    top: 8.0,
                    left: 12.0,
                    right: 12.0,
                  ),
                  hintText: 'Title here..',
                  hintStyle: context.textTheme.headlineMedium
                      ?.copyWith(color: AppColor.grey),
                  border: const UnderlineInputBorder(),
                  enabledBorder: const UnderlineInputBorder(),
                  focusedBorder: const UnderlineInputBorder(),
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: bodyController,
                  expands: true,
                  minLines: null,
                  maxLines: null,
                  cursorHeight: 24.0,
                  cursorColor: AppColor.primary,
                  style: context.textTheme.bodyLarge,
                  decoration: InputDecoration(
                    hintText: 'Body here..',
                    hintStyle: context.textTheme.bodyLarge
                        ?.copyWith(color: AppColor.grey),
                    border:
                        const UnderlineInputBorder(borderSide: BorderSide.none),
                    enabledBorder:
                        const UnderlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        const UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              Consumer(
                builder: (context, ref, child) {
                  final category = ref.watch(blogSelectedCategoryProvider);
                  if (category == null) {
                    return const SizedBox.shrink();
                  }
                  return ActionChip(
                    onPressed: () {
                      ref.read(blogSelectedCategoryProvider.notifier).update(
                            (state) => null,
                          );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side:
                            const BorderSide(color: AppColor.blackColorFaded)),
                    padding: const EdgeInsets.all(2.0),
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 4.0,
                      children: [
                        Text(
                          '${category.icon ?? '❇'} ${category.name}',
                        ),
                        const Icon(
                          Icons.close_rounded,
                          size: 18.0,
                          color: AppColor.primary,
                        )
                      ],
                    ),
                  );
                },
              ),
              Consumer(
                builder: (context, ref, child) {
                  final pagingController = ref
                      .watch(paginatedCategoryProvider.notifier)
                      .pagingController;
                  final searchCategoryQuery =
                      ref.watch(searchCategoryQueryProvider);
                  return Autocomplete<CategoryDto>(
                    optionsBuilder: (textEditingValue) async {
                      final value = textEditingValue.text;
                      if (value.isEmpty) {
                        ref.read(searchCategoryQueryProvider.notifier).update(
                              (state) => '',
                            );
                        return pagingController.itemList ??
                            [EmptyCategoryFeed()];
                      } else {
                        ref.read(searchCategoryQueryProvider.notifier).update(
                              (state) => value,
                            );
                        var results = <CategoryDto>[];
                        results = await ref.read(
                          categorySearchProvider(
                            value.toLowerCase(),
                          ).future,
                        );
                        if (results.isEmpty) {
                          results.add(EmptyCategoryFeed());
                        }
                        return results;
                      }
                    },
                    displayStringForOption: (option) => option.name,
                    fieldViewBuilder:
                        (_, textEditingController, focusNode, __) =>
                            AutoTextField(
                      key: customKey2,
                      textEditingController: textEditingController,
                      focusNode: focusNode,
                      hintText: 'Select category',
                    ),
                    optionsViewBuilder: (context, onSelected, filteredItems) {
                      const separator = Divider(
                        color: AppColor.blackColorFaded,
                        thickness: 0.25,
                      );
                      return Align(
                        alignment: Alignment.topLeft,
                        child: Material(
                          elevation: 2.0,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(6.0),
                            bottomRight: Radius.circular(6.0),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: 280.0,
                              maxWidth: context.width - 16.0,
                            ),
                            child: searchCategoryQuery.isNotEmpty
                                ? filteredItems.first is EmptyCategoryFeed
                                    ? emptyTile(
                                        () => pagingController.refresh(),
                                        false,
                                      )
                                    : ListView.separated(
                                        shrinkWrap: true,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0,
                                        ),
                                        itemBuilder: (_, index) {
                                          final tag =
                                              filteredItems.elementAt(index);
                                          return _categoryItemBuilder(tag);
                                        },
                                        separatorBuilder: (context, index) =>
                                            separator,
                                        itemCount: filteredItems.length,
                                      )
                                : PagedListView.separated(
                                    shrinkWrap: true,
                                    pagingController: pagingController,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    builderDelegate:
                                        PagedChildBuilderDelegate<CategoryDto>(
                                      noItemsFoundIndicatorBuilder: (_) =>
                                          emptyTile(
                                        () => pagingController.refresh(),
                                        false,
                                      ),
                                      itemBuilder: (context, item, index) {
                                        if (index == 0) {
                                          return const SizedBox.shrink();
                                        }
                                        return _categoryItemBuilder(item);
                                      },
                                    ),
                                    separatorBuilder: (_, index) => index == 0
                                        ? const SizedBox.shrink()
                                        : separator,
                                  ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              Consumer(
                builder: (___, __, _) => Wrap(
                  spacing: 4.0,
                  alignment: WrapAlignment.start,
                  children: [
                    ...ref.watch(selectedTagsProvider).map(
                          (e) => ActionChip(
                            onPressed: () {
                              ref
                                  .read(selectedTagsProvider.notifier)
                                  .operation(e);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: const BorderSide(
                                    color: AppColor.blackColorFaded)),
                            padding: const EdgeInsets.all(2.0),
                            label: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              spacing: 4.0,
                              children: [
                                Text(
                                  '🏷️ ${e.name}',
                                  style: const TextStyle(
                                      color: AppColor.blackColor),
                                ),
                                const Icon(
                                  Icons.close_rounded,
                                  size: 18.0,
                                  color: AppColor.primary,
                                )
                              ],
                            ),
                          ),
                        )
                  ],
                ),
              ),
              Consumer(
                builder: (context, ref, child) {
                  final pagingController =
                      ref.watch(paginatedTagProvider.notifier).pagingController;
                  final searchTagQuery = ref.watch(searchTagQueryProvider);
                  return Autocomplete<TagDto>(
                    optionsBuilder: (textEditingValue) async {
                      final value = textEditingValue.text;
                      if (value.isEmpty) {
                        ref.read(searchTagQueryProvider.notifier).update(
                              (state) => '',
                            );
                        return pagingController.itemList ?? [EmptyTagFeed()];
                      } else {
                        ref.read(searchTagQueryProvider.notifier).update(
                              (state) => value,
                            );
                        var results = <TagDto>[];
                        results = await ref.read(
                          tagSearchProvider(
                            value.toLowerCase(),
                          ).future,
                        );
                        if (results.isEmpty) {
                          results.add(EmptyTagFeed());
                        }
                        return results;
                      }
                    },
                    displayStringForOption: (option) => option.name,
                    fieldViewBuilder:
                        (_, textEditingController, focusNode, __) =>
                            AutoTextField(
                      key: customKey,
                      textEditingController: textEditingController,
                      focusNode: focusNode,
                      hintText: 'Select tags',
                    ),
                    optionsViewBuilder: (context, onSelected, filteredItems) {
                      const separator = Divider(
                        color: AppColor.blackColorFaded,
                        thickness: 0.25,
                      );
                      return Align(
                        alignment: Alignment.topLeft,
                        child: Material(
                          elevation: 2.0,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(6.0),
                            bottomRight: Radius.circular(6.0),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: 280.0,
                              maxWidth: context.width - 16.0,
                            ),
                            child: searchTagQuery.isNotEmpty
                                ? filteredItems.first is EmptyTagFeed
                                    ? emptyTile(
                                        () => pagingController.refresh(),
                                        true,
                                      )
                                    : ListView.separated(
                                        shrinkWrap: true,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0,
                                        ),
                                        itemBuilder: (_, index) {
                                          final tag =
                                              filteredItems.elementAt(index);
                                          return _itemBuilder(tag);
                                        },
                                        separatorBuilder: (context, index) =>
                                            separator,
                                        itemCount: filteredItems.length,
                                      )
                                : PagedListView.separated(
                                    shrinkWrap: true,
                                    pagingController: pagingController,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    builderDelegate:
                                        PagedChildBuilderDelegate<TagDto>(
                                      noItemsFoundIndicatorBuilder: (_) =>
                                          emptyTile(
                                        () => pagingController.refresh(),
                                        true,
                                      ),
                                      itemBuilder: (context, item, index) {
                                        return _itemBuilder(item);
                                      },
                                    ),
                                    separatorBuilder: (_, index) => separator,
                                  ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(bottom: context.bottomPadding),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget emptyTile(VoidCallback onSuccess, bool forTag) => ListTile(
        dense: true,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${forTag ? 'Tag' : 'Category'} not found!'),
            TextButton(
                onPressed: () async {
                  try {
                    if (forTag) {
                      if (ref.read(searchTagQueryProvider).isEmpty) {
                        context.showSnackBar('Enter the tag name first!');
                        return;
                      }
                      ref.read(loaderProvider.notifier).showLoader();
                      final newTag =
                          await ref.read(clientProvider).tag.createTag(
                                ref.read(searchTagQueryProvider),
                              );
                      ref.read(selectedTagsProvider.notifier).operation(newTag);
                      onSuccess.call();
                      customKey.currentState?.resetSearch();
                    } else {
                      if (ref.read(searchCategoryQueryProvider).isEmpty) {
                        context.showSnackBar('Enter the category name first!');
                        return;
                      }
                      ref.read(loaderProvider.notifier).showLoader();
                      final newCategory = await ref
                          .read(clientProvider)
                          .category
                          .createCategory(
                            ref.read(searchCategoryQueryProvider),
                          );
                      ref.read(blogSelectedCategoryProvider.notifier).update(
                            (state) => newCategory,
                          );
                      onSuccess.call();
                      customKey2.currentState?.resetSearch();
                    }
                  } catch (e) {
                    context.showSnackBar(e.toString());
                  } finally {
                    ref.read(loaderProvider.notifier).hideLoader();
                  }
                },
                child: forTag
                    ? const Text('Create Tag')
                    : const Text('Create Category'))
          ],
        ),
      );

  Widget _categoryItemBuilder(CategoryDto item) => InkWell(
        onTap: () {
          ref.read(blogSelectedCategoryProvider.notifier).update(
                (state) => item,
              );
          ref.read(searchCategoryQueryProvider.notifier).update(
                (state) => '',
              );
          customKey2.currentState?.resetSearch();
        },
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${item.icon ?? '❇'} ${item.name}'),
              CircleAvatar(
                maxRadius: 16.0,
                backgroundColor: AppColor.grey.withValues(alpha: 0.2),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ref.watch(blogSelectedCategoryProvider)?.id == item.id
                      ? const Icon(
                          Icons.check,
                          color: AppColor.primary,
                        )
                      : Text(
                          item.postCount.toString(),
                          style: context.textTheme.bodySmall,
                        ),
                ),
              )
            ],
          ),
        ),
      );
  Widget _itemBuilder(TagDto item) => InkWell(
        onTap: () {
          ref.read(selectedTagsProvider.notifier).operation(item);
          ref.read(searchTagQueryProvider.notifier).update(
                (state) => '',
              );
          customKey.currentState?.resetSearch();
        },
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(item.name),
              CircleAvatar(
                maxRadius: 16.0,
                backgroundColor: AppColor.grey.withValues(alpha: 0.2),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child:
                      ref.watch(selectedTagsProvider.notifier).contains(item.id)
                          ? const Icon(
                              Icons.check,
                              color: AppColor.primary,
                            )
                          : Text(
                              item.postCount.toString(),
                              style: context.textTheme.bodySmall,
                            ),
                ),
              )
            ],
          ),
        ),
      );
}

class SelectedTags extends StateNotifier<List<TagDto>> {
  SelectedTags() : super(List.empty());

  void operation(TagDto item) {
    if (state.any(
      (element) => element.id == item.id,
    )) {
      final data = state;
      data.removeWhere(
        (element) => element.id == item.id,
      );
      state = [...data];
    } else {
      state = [...state, item];
    }
  }

  init(List<TagDto> items) {
    state = [...items];
  }

  bool contains(int id) => state.any(
        (element) => element.id == id,
      );
}

final selectedTagsProvider =
    StateNotifierProvider.autoDispose<SelectedTags, List<TagDto>>((ref) {
  return SelectedTags();
});

final blogSelectedCategoryProvider = StateProvider<CategoryDto?>((ref) {
  return null;
});

class AutoTextField extends StatefulWidget {
  const AutoTextField({
    super.key,
    required this.textEditingController,
    required this.focusNode,
    required this.hintText,
  });
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final String hintText;

  @override
  State<AutoTextField> createState() => AutoTextFieldState();
}

class AutoTextFieldState extends State<AutoTextField> {
  late ValueNotifier<String> onTextChanged;

  @override
  void initState() {
    super.initState();
    onTextChanged = ValueNotifier('');
    widget.textEditingController.addListener(listener);
  }

  @override
  void dispose() {
    onTextChanged.dispose();
    super.dispose();
  }

  void listener() {
    onTextChanged.value = widget.textEditingController.text;
  }

  resetSearch() {
    widget.textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      focusNode: widget.focusNode,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: const UnderlineInputBorder(),
        enabledBorder: const UnderlineInputBorder(),
        focusedBorder: const UnderlineInputBorder(),
        suffixIcon: ValueListenableBuilder(
          valueListenable: onTextChanged,
          builder: (ctx, value, _) {
            return value.isEmpty
                ? const SizedBox.shrink()
                : InkWell(
                    onTap: resetSearch,
                    child: const Icon(Icons.clear),
                  );
          },
        ),
      ),
    );
  }
}
