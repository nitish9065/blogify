// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blogify_flutter/core/provider/app_state_provider.dart';
import 'package:blogify_flutter/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScaffold extends StatelessWidget {
  const HomeScaffold({
    super.key,
    required this.navigationShell,
  });
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: navigationShell.currentIndex == 0,
      onPopInvokedWithResult: (didPop, _) {
        if (navigationShell.currentIndex != 0) {
          navigationShell.goBranch(0);
        }
      },
      child: Scaffold(
        body: navigationShell,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navigationShell.currentIndex,
          selectedIconTheme:
              IconThemeData(color: AppColor.mainApppurpleColor, size: 24),
          selectedFontSize: 14.0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColor.mainApppurpleColor,
          onTap: (value) {
            navigationShell.goBranch(
              value,
              initialLocation: value == navigationShell.currentIndex,
            );
          },
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              activeIcon: Icon(Icons.search_rounded),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Consumer(
                builder: (context, ref, child) {
                  final appState = ref.watch(appFlowStateProvider);
                  if (appState is AppStateSuccess) {
                    return CircleAvatar(
                      radius: 14.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(32.0),
                        child: Image.network(appState.user.profileUrl),
                      ),
                    );
                  }
                  return const CircleAvatar(
                    radius: 14.0,
                    child: Icon(Icons.person),
                  );
                },
              ),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
