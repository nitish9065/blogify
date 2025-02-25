import 'package:blogify_client/blogify_client.dart';
import 'package:blogify_flutter/features/home/widgets/sure_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:blogify_flutter/core/extensions/context_extension.dart';
import 'package:blogify_flutter/core/provider/app_state_provider.dart';
import 'package:blogify_flutter/core/provider/loader.dart';
import 'package:blogify_flutter/core/theme/app_color.dart';
import 'package:blogify_flutter/core/widgets/app_scaffold.dart';
import 'package:blogify_flutter/features/auth/auth_page.dart';
import 'package:blogify_flutter/features/auth/provider/sign_up_provider.dart';
import 'package:blogify_flutter/features/home/provider/paginated_blog_provider.dart';
import 'package:blogify_flutter/features/home/provider/paginated_category_provider.dart';
import 'package:blogify_flutter/features/home/provider/selected_category_provider.dart';
import 'package:blogify_flutter/features/home/view/pages/create_blog_page.dart';
import 'package:blogify_flutter/features/home/widgets/blog_listing.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static String get route => '/feed';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(
          'BlogiFY',
          style: context.textTheme.headlineSmall?.copyWith(
            color: AppColor.whiteColor,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_active_rounded,
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              final appState = ref.watch(appFlowStateProvider);
              if (appState is AppStateSuccess) {
                return IconButton(
                  onPressed: () async {
                    final shouldLogout = await getDialog(
                        context: context,
                        title: 'Do you want to logout?',
                        content: "You'll be only serves as guest in the app!");
                    if (shouldLogout) {
                      try {
                        ref.read(loaderProvider.notifier).showLoader();
                        await ref.read(signUpProvider.notifier).signout();
                      } catch (e) {
                        if (context.mounted) {
                          context.showSnackBar(e.toString());
                        }
                      } finally {
                        ref.read(loaderProvider.notifier).hideLoader();
                      }
                    }
                  },
                  icon: const Icon(Icons.logout_outlined),
                );
              } else if (appState is AppStateGuest) {
                return IconButton(
                  onPressed: () async {
                    context.push(AuthPage.route);
                  },
                  icon: const Icon(Icons.login),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
        bottom: const CustomBottom(),
      ),
      body: const PaginatedBlog(),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          final user = ref.watch(appFlowStateProvider);
          if (user is AppStateSuccess) {
            return FloatingActionButton(
              onPressed: () async {
                await context.push('${HomePage.route}${CreateBlogPage.route}');
              },
              child: const Icon(Icons.add),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class PaginatedBlog extends StatelessWidget {
  const PaginatedBlog({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, child) {
        final selectedCategory = ref.watch(selectedCategoryProvider);
        if (selectedCategory != null && selectedCategory.id != 0) {
          var provider = paginatedBlogProvider(categoryId: selectedCategory.id);
          final PagingController<int, BlogDto> blogPagingController;
          if (!ref.exists(provider)) {
            blogPagingController =
                ref.watch(provider.notifier).pagingController;
            blogPagingController.notifyPageRequestListeners(1);
          } else {
            blogPagingController =
                ref.watch(provider.notifier).pagingController;
          }

          return RefreshIndicator(
            color: AppColor.mainApppurpleColor,
            onRefresh: () async {
              ref.read(provider.notifier).internalRefresh();
            },
            child: BlogListing(
              blogPagingController: blogPagingController,
            ),
          );
        }
        final blogPagingController = ref
            .watch(paginatedBlogProvider(categoryId: null).notifier)
            .pagingController;
        return RefreshIndicator(
          color: AppColor.mainApppurpleColor,
          onRefresh: () async {
            ref
                .read(paginatedBlogProvider(categoryId: null).notifier)
                .refreshHome();
          },
          child: BlogListing(
            blogPagingController: blogPagingController,
          ),
        );
      },
    );
  }
}

class CustomBottom extends ConsumerWidget implements PreferredSizeWidget {
  const CustomBottom({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingController =
        ref.watch(paginatedCategoryProvider.notifier).pagingController;
    return SizedBox(
      height: preferredSize.height,
      width: double.infinity,
      child: PagedListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        clipBehavior: Clip.antiAlias,
        pagingController: pagingController,
        builderDelegate: PagedChildBuilderDelegate<CategoryDto>(
          firstPageProgressIndicatorBuilder: (context) => Row(
            children: List.generate(
              10,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Chip(
                  label: const Text('Loading...'),
                  backgroundColor: AppColor.whiteColor.withValues(alpha: 0.5),
                ),
              ),
            ).toList(),
          ),
          itemBuilder: (context, category, index) {
            final selectedCategory = ref.watch(selectedCategoryProvider);
            final selected = selectedCategory != null
                ? selectedCategory.id == category.id
                : false;
            return ChoiceChip(
              selectedColor: AppColor.transparent,
              showCheckmark: false,
              clipBehavior: Clip.antiAlias,
              disabledColor: Colors.grey,
              selected: selected,
              labelStyle: const TextStyle(color: AppColor.blackColor),
              side: BorderSide(
                color: selected ? AppColor.redColor : AppColor.cardBgColor,
                width: 1.2,
              ),
              onSelected: (selected) {
                if (selected) {
                  ref
                      .read(selectedCategoryProvider.notifier)
                      .selectCategory(category);
                }
              },
              label: Text(
                '${category.icon} ${category.name} (${category.postCount})',
              ),
            );
          },
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 6.0,
        ),
      ),
    );
  }
}
