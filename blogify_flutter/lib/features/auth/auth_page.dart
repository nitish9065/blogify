import 'package:animations/animations.dart';
import 'package:blogify_flutter/features/auth/provider/auth_page_provider.dart';
import 'package:blogify_flutter/features/auth/signup/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'login/login_page.dart';

class AuthPage extends ConsumerWidget {
  static String get route => '/auth';

  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showLogin = ref.watch(authPageProvider);
    // return SignupPage();
    return PageTransitionSwitcher(
      reverse: showLogin,
      transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
        return SharedAxisTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.horizontal,
          child: child,
        );
      },
      child: showLogin ? const LoginPage() : const SignupPage(),
    );
  }
}
