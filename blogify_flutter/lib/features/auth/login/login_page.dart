import 'dart:developer';

import 'package:blogify_flutter/core/extensions/context_extension.dart';
import 'package:blogify_flutter/core/provider/loader.dart';
import 'package:blogify_flutter/core/provider/session_provider.dart';
import 'package:blogify_flutter/features/auth/provider/auth_page_provider.dart';
import 'package:blogify_flutter/core/theme/app_color.dart';
import 'package:blogify_flutter/core/widgets/app_constrained_scroll_view.dart';
import 'package:blogify_flutter/core/widgets/app_scaffold.dart';
import 'package:blogify_flutter/core/widgets/app_textfield.dart';
import 'package:blogify_flutter/core/widgets/tappable.dart';
import 'package:blogify_flutter/features/auth/provider/sign_up_provider.dart';
import 'package:blogify_flutter/features/auth/provider/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    animation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: const Offset(-1.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.slowMiddle,
      ),
    );
    animationController.repeat(
      reverse: false,
    );
    emailController = TextEditingController();
    passwordController = TextEditingController();

    ref.listenManual(
      signUpProvider,
      (previous, next) {
        if (next is SignUpLoadingState) {
          ref.read(loaderProvider.notifier).showLoader();
        } else {
          ref.read(loaderProvider.notifier).hideLoader();
          if (next is SignUpErrorState) {
            context.showSnackBar(next.error);
          }
          if (next is SignUpSuccessState) {
            log('Successfully logged In ${ref.read(sessionManagerProvider).signedInUser}');
            context.pop();
          }
        }
      },
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      releaseFocus: true,
      resizeToAvoidBottomInset: true,
      body: AppConstrainedScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              color: AppColor.mainApppurpleColor,
            ),
            if (context.canPop()) ...[
              Positioned(
                top: 8.0,
                child: IconButton(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColor.backgroundColor,
                  ),
                ),
              )
            ],
            Positioned(
              top: kBottomNavigationBarHeight / 2,
              left: 16.0,
              right: 16.0,
              child: Padding(
                padding: const EdgeInsets.only(top: kToolbarHeight / 4),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Hello there, Welcome Back to Your Blog Heaven!',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: AppColor.whiteColor,
                              ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    AnimatedBuilder(
                      animation: animation,
                      builder: (context, child) => SlideTransition(
                        position: animation,
                        child: FittedBox(
                          child: Text(
                            'Reconnect with Your Creativity! Step Back into the Spotlight!',
                            maxLines: 1,
                            softWrap: true,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: AppColor.yellowColor,
                                      fontSize: 18,
                                    ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.2,
                left: 8.0,
                right: 8.0,
              ),
              child: Card(
                elevation: 1.5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Login',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('No Account?'),
                          TextButton(
                            onPressed: () {
                              ref
                                  .read(authPageProvider.notifier)
                                  .showLogin(false);
                            },
                            child: const Text(
                              'Create One',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Form(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AppTextfield(
                              controller: emailController,
                              hintText: 'Email',
                              keyboardType: TextInputType.emailAddress,
                              prefixIcon: Icons.mail,
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            PasswordField(
                              controller: passwordController,
                              action: TextInputAction.done,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Tappable(
                          onTap: () {},
                          animationEffect: TappableAnimationEffect.fade,
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                              color: AppColor.primary.withValues(alpha: 0.7),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          context.removeFocus();

                          await ref.read(signUpProvider.notifier).login(
                                emailController.text.trim(),
                                passwordController.text,
                              );
                          return;
                        },
                        child: const Text('Sign In'),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 8.0,
              left: 0.0,
              right: 0.0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeInOut,
                opacity: MediaQuery.of(context).viewInsets.bottom == 0 ? 1 : 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Powered By ',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/images/serverpod-logo.svg',
                      width: 50,
                      height: 30,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
