import 'dart:developer';

import 'package:blogify_flutter/core/extensions/context_extension.dart';
import 'package:blogify_flutter/core/theme/app_color.dart';
import 'package:blogify_flutter/core/utils/strings.dart';
import 'package:blogify_flutter/core/widgets/app_constrained_scroll_view.dart';
import 'package:blogify_flutter/core/widgets/app_scaffold.dart';
import 'package:blogify_flutter/core/widgets/app_textfield.dart';
import 'package:blogify_flutter/features/home/provider/latest_blog_tag_provider.dart';
import 'package:blogify_flutter/features/home/widgets/blog_feed.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});
  static String get route => '/search';

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  late final TextEditingController searchController;
  late final ValueNotifier<bool> showCancel;
  late final FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    focusNode = FocusNode();
    searchController.addListener(listenController);
    showCancel = ValueNotifier(false);
  }

  void listenController() {
    if (searchController.text.isNotEmpty) {
      if (showCancel.value) {
        return;
      }
      showCancel.value = true;
    } else {
      if (!showCancel.value) {
        return;
      }
      showCancel.value = false;
    }
  }

  @override
  void dispose() {
    searchController.removeListener(listenController);
    searchController.dispose();
    focusNode.dispose();
    showCancel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(latestTagProvider);
        ref.invalidate(latestBlogProvider);
      },
      child: AppScaffold(
        releaseFocus: true,
        body: AppConstrainedScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16.0,
            children: [
              AppTextfield(
                maxLine: 2,
                autofocus: true,
                focusNode: focusNode,
                controller: searchController,
                capitalization: TextCapitalization.none,
                suffix: ValueListenableBuilder(
                  valueListenable: showCancel,
                  builder: (context, value, child) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: value
                          ? InkWell(
                              onTap: () {
                                searchController.clear();
                              },
                              child: const Icon(
                                Icons.clear,
                              ),
                            )
                          : const SizedBox.shrink(),
                    );
                  },
                ),
                hintText: 'Search ${ref.watch(searchByFieldProvider)}',
              ),
              Consumer(
                builder: (context, ref, child) {
                  final searchField = ref.watch(searchByFieldProvider);
                  return Container(
                    color: Colors.grey.shade200,
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${Strings.searchWith} ',
                          style: context.textTheme.bodyMedium,
                        ),
                        DropdownButton<String>(
                          hint: Text(
                            searchField,
                          ),
                          items: Strings.searchField.map((option) {
                            return DropdownMenuItem<String>(
                              value: option,
                              child: Text(option),
                              onTap: () {
                                ref.read(searchByFieldProvider.notifier).update(
                                      (state) => option,
                                    );
                                searchController.clear();
                                focusNode.requestFocus();
                              },
                            );
                          }).toList(),
                          onChanged: (value) {
                            log('new fiel;d to be search with $value');
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              ref.watch(latestTagProvider).when(
                    data: (tags) => Wrap(
                      spacing: 4.0,
                      alignment: WrapAlignment.start,
                      children: [
                        ...tags.map(
                          (e) => Chip(
                            backgroundColor:
                                AppColor.stackBackgroundColor.withValues(
                              alpha: 0.75,
                            ),
                            padding: const EdgeInsets.all(2.0),
                            label: Text(
                              '🏷️ ${e.name} (${e.postCount})',
                              style: const TextStyle(
                                  color: AppColor.backgroundColor),
                            ),
                          ),
                        )
                      ],
                    ),
                    error: (error, stackTrace) => const Center(
                      child: Text('Error fetching latest tags'),
                    ),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ref.watch(latestBlogProvider).when(
                    data: (blogs) {
                      if (blogs.isEmpty) {
                        return const Center(
                          child: Text('No Blogs Found!'),
                        );
                      }
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ...List.generate(
                            blogs.length,
                            (index) => BlogFeed(
                              blog: blogs[index],
                            ),
                          ),
                        ],
                      );
                    },
                    error: (error, stackTrace) => const Center(
                      child: Text('Error fetching latest tags'),
                    ),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

final searchByFieldProvider = StateProvider.autoDispose<String>(
  (ref) {
    return Strings.searchField[0];
  },
);
