
import 'package:blogify_client/blogify_client.dart';
import 'package:blogify_flutter/core/data/auth_service.dart';
import 'package:blogify_flutter/core/exceptions/api_exception.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

class AuthServiceImpl extends AuthService {
  final Client client;
  final SessionManager sessionManager;

  AuthServiceImpl(this.client, this.sessionManager);

  @override
  Future<bool> createAccountRequest(
      {required String email,
      required String password,
      required String userName}) async {
    try {
      final emailAvailable = await client.user.isEmailAvailable(email);

      if (!emailAvailable) {
        throw ServerException(message: 'Email already in use, please login!');
      }

      final result = await client.modules.auth.email
          .createAccountRequest(userName, email, password);

      if (!result) {
        throw ServerException(
          message: 'Could not create account',
        );
      }
      return true;
    } catch (e) {
      throw ApiExcepion.onError(e);
    }
  }

  @override
  Future<bool> logInWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final authenticationResponse =
          await client.modules.auth.email.authenticate(email, password);
      if (!authenticationResponse.success) {
        throw ServerException(
          message: authenticationResponse.failReason?.name ??
              'Failed to authenticate user with provided username, password',
        );
      }
      final keyId = authenticationResponse.keyId;
      final userInfo = authenticationResponse.userInfo;
      final key = authenticationResponse.key;

      if (key == null || keyId == null || userInfo == null) {
        throw ServerException(
          message:
              '${userInfo == null ? 'User details ' : 'Authentication token '} not found',
        );
      }
      await sessionManager.registerSignedInUser(userInfo, keyId, key);
      return true;
    } catch (e) {
      throw ApiExcepion.onError(e);
    }
  }

  @override
  Future<bool> verifyAccount(
      {required String verifcationCode,
      required String email,
      required String password}) async {
    try {
      final userInfo =
          await client.modules.auth.email.createAccount(email, verifcationCode);
      if (userInfo == null) {
        throw ServerException(
          message: 'Could not create account',
        );
      }
      return await logInWithEmailPassword(email: email, password: password);
    } catch (e) {
      throw ApiExcepion.onError(e);
    }
  }
}
