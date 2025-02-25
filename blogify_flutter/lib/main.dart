import 'dart:developer';

import 'package:blogify_flutter/core/provider/loader.dart';
import 'package:blogify_flutter/core/routes/router_provider.dart';
import 'package:blogify_flutter/core/theme/app_color.dart';
import 'package:flutter/material.dart';

import 'dart:async';

import 'package:blogify_flutter/core/extensions/context_extension.dart';
import 'package:blogify_flutter/core/provider/app_state_provider.dart';
import 'package:blogify_flutter/core/theme/app_theme.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:svg_flutter/svg.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appFlowStateProvider);
    if (appState is AppStateGuest || appState is AppStateSuccess) {
      final loading = ref.watch(loaderProvider);
      return MaterialApp.router(
        title: 'Serverpod Demo',
        theme: AppTheme.appTheme,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        routerConfig: ref.watch(routerProvider),
        builder: (context, child) {
          return Stack(
            children: [
              child ?? Container(),
              Positioned.fill(
                child: loading
                    ? const Stack(
                        fit: StackFit.expand,
                        children: [
                          ModalBarrier(
                            color: AppColor.blackColorFaded,
                            dismissible: false,
                          ),
                          Align(
                            child: CircularProgressIndicator(
                              color: AppColor.whiteColor,
                            ),
                          )
                        ],
                      )
                    : const SizedBox.shrink(),
              )
            ],
          );
        },
      );
    }
    return MaterialApp(
      title: 'Serverpod Demo',
      theme: AppTheme.appTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  double scale = 1.0;
  late Timer timer;

  void _changeScale() {
    setState(() {
      scale = scale == 1.0 ? 1.5 : 1.0;
    });
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      const Duration(milliseconds: 700),
      (timer) => _changeScale(),
    );

    ref.listenManual(
      appFlowStateProvider,
      (previous, next) {
        log('state of the app is ${next.toString()}');
        if (next is AppStateError) {
          context.showSnackBar(next.error);
          timer.cancel();
          // print('Error occured while initializng the app ${next.error}');
        }
      },
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColor.blackColor.withValues(alpha: 0.2),
          statusBarBrightness: Brightness.light,
        ),
      ),
      body: AnimatedScale(
        scale: scale,
        duration: const Duration(milliseconds: 700),
        child: Center(
          child: SvgPicture.asset(
            'assets/images/serverpod-logo.svg',
            width: context.width * 0.5,
          ),
        ),
      ),
    );
  }
}
