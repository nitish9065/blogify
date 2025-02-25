import 'package:blogify_client/blogify_client.dart';
import 'package:blogify_flutter/features/auth/auth_page.dart';
import 'package:blogify_flutter/features/home/home.dart';
import 'package:blogify_flutter/features/home/models/user_blog_parameters.dart';
import 'package:blogify_flutter/features/home/view/account_page.dart';
import 'package:blogify_flutter/features/home/view/pages/create_blog_page.dart';
import 'package:blogify_flutter/features/home/view/search_page.dart';
import 'package:blogify_flutter/features/home/view/feed_detail.dart';
import 'package:blogify_flutter/features/home/view/home_page.dart';
import 'package:blogify_flutter/features/home/view/pages/user_blog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: HomePage.route,
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: AuthPage.route,
        name: 'authPage',
        builder: (context, state) => const AuthPage(),
      ),
      StatefulShellRoute.indexedStack(
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: HomePage.route,
                name: 'homePage',
                builder: (context, state) => const HomePage(),
                routes: [
                  GoRoute(
                    parentNavigatorKey: navigatorKey,
                    path: CreateBlogPage.route,
                    name: 'createBlog',
                    builder: (context, state) => CreateBlogPage(
                      blog: state.extra as BlogDto?,
                    ),
                  ),
                  GoRoute(
                    parentNavigatorKey: navigatorKey,
                    path: '/:id',
                    name: 'feedDetail',
                    builder: (context, state) {
                      final map = state.extra as Map<String, dynamic>;
                      assert(map['blog'] is BlogDto,
                          "Must pass the initial blog as extras");
                      return FeedDetail(
                        blogId:
                            int.tryParse(state.pathParameters['id'] ?? '0') ??
                                0,
                        blog: map['blog'] as BlogDto,
                        forPreview: map['preview'] ?? false,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: SearchPage.route,
                name: 'categoryPage',
                builder: (context, state) => const SearchPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AccountPage.route,
                name: 'accountPage',
                builder: (context, state) => const AccountPage(),
                routes: [
                  GoRoute(
                    path: '/:id/blogs',
                    name: 'userBlogPage',
                    parentNavigatorKey: navigatorKey,
                    builder: (context, state) {
                      final userId =
                          int.tryParse(state.pathParameters['id'] ?? '0') ?? 0;
                      final params = state.extra as UserBlogParameters?;
                      assert(userId != 0 && params != null,
                          'UserId & parameters must be provided to child page');
                      return UserBlogPage(
                        userId: userId,
                        params: params!,
                      );
                    },
                  )
                ],
              ),
            ],
          )
        ],
        builder: (context, state, navigationShell) {
          return HomeScaffold(navigationShell: navigationShell);
        },
      )
    ],
  );
});
