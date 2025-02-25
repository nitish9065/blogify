import 'package:serverpod/serverpod.dart';

import 'package:blogify_server/src/web/routes/root.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;
import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';
import 'src/utils/server_mailer.dart';
// This is the starting point of your Serverpod server. In most cases, you will
// only need to make additions to this file if you add future calls,  are
// configuring Relic (Serverpod's web-server), or need custom setup work.

void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: auth.authenticationHandler,
  );

  // Setting up the authentication configuration...
  auth.AuthConfig.set(
    auth.AuthConfig(
      onUserCreated: (session, userInfo) async {
        if (userInfo.id == null || userInfo.email == null) {
          await auth.UserInfo.db.deleteRow(session, userInfo);
          return;
        }
        var newUser = AppUser(userInfoId: userInfo.id!, bio: '');
        await AppUser.db.insertRow(session, newUser);
        return;
      },
      sendValidationEmail: (session, email, validationCode) async {
        print('Validation code for email $email is $validationCode');
        final isSuccess = await ServerMailer.sendOTPMail(validationCode, email);
        return isSuccess;
      },
      sendPasswordResetEmail: (session, userInfo, validationCode) async {
        print('Validation code for email ${userInfo.email} is $validationCode');
        return true;
      },
    ),
  );

  // If you are using any future calls, they need to be registered here.
  // pod.registerFutureCall(ExampleFutureCall(), 'exampleFutureCall');

  // Setup a default page at the web root.
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');
  // Serve all files in the /static directory.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );

  // Start the server.
  await pod.start();
  // final internal = await pod.createSession();
  // seedData(internal);
}

Future<void> seedData(Session session) async {}
