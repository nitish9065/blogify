import 'dart:developer';
import 'package:blogify_flutter/core/extensions/context_extension.dart';
import 'package:blogify_flutter/core/provider/loader.dart';
import 'package:blogify_flutter/core/provider/session_provider.dart';
import 'package:blogify_flutter/core/theme/app_color.dart';
import 'package:blogify_flutter/core/widgets/app_constrained_scroll_view.dart';
import 'package:blogify_flutter/core/widgets/app_scaffold.dart';
import 'package:blogify_flutter/core/widgets/app_textfield.dart';
import 'package:blogify_flutter/features/auth/provider/auth_page_provider.dart';
import 'package:blogify_flutter/features/auth/provider/sign_up_provider.dart';
import 'package:blogify_flutter/features/auth/provider/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController otpController;

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
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    otpController = TextEditingController();

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
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    otpController.dispose();
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
                      'Create, Share, Inspire – It Begins with You.',
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
                            'Sign Up and Let the World Hear You!  Your Story Starts Here - Join Now!',
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
                        'Signup',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Already Have an Account?'),
                          TextButton(
                            onPressed: () {
                              ref
                                  .read(authPageProvider.notifier)
                                  .showLogin(true);
                            },
                            child: const Text(
                              'Login',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Form(
                        child: Consumer(builder: (_, ref, child) {
                          final signUpState = ref.watch(signUpProvider);
                          if (signUpState is SignUpOtpRequested) {
                            return AppTextfield(
                              controller: otpController,
                              hintText: 'OTP',
                              prefixIcon: Icons.lock,
                              action: TextInputAction.done,
                            );
                          }
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AppTextfield(
                                controller: nameController,
                                hintText: 'Name',
                                capitalization: TextCapitalization.words,
                                prefixIcon: Icons.person_2_rounded,
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              AppTextfield(
                                controller: emailController,
                                hintText: 'Email',
                                keyboardType: TextInputType.emailAddress,
                                prefixIcon: Icons.email,
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              PasswordField(
                                controller: passwordController,
                              ),
                            ],
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          context.removeFocus();
                          var signUpState = ref.read(signUpProvider);
                          if (signUpState is SignUpOtpRequested) {
                            await ref
                                .read(signUpProvider.notifier)
                                .verifyAccount(
                                    signUpState.email,
                                    otpController.text.trim(),
                                    signUpState.password);
                            return;
                          }
                          await ref
                              .read(signUpProvider.notifier)
                              .createAccountRequest(
                                emailController.text.trim(),
                                nameController.text.trim(),
                                passwordController.text.trim(),
                              );
                          return;
                        },
                        child: const Text('Create'),
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
