import 'package:blogify_client/blogify_client.dart';
import 'package:blogify_flutter/core/provider/app_state_provider.dart';
import 'package:blogify_flutter/core/provider/auth_service_provider.dart';
import 'package:blogify_flutter/core/provider/client_provider.dart';
import 'package:blogify_flutter/core/provider/session_provider.dart';
import 'package:blogify_flutter/features/auth/provider/sign_up_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_provider.g.dart';

@riverpod
class SignUp extends _$SignUp {
  @override
  SignUpState build() {
    return SignUpInitialState();
  }

  Future<void> createAccountRequest(
      String email, String name, String password) async {
    try {
      state = SignUpLoadingState();
      await ref.read(authServiceProvider).createAccountRequest(
          email: email, password: password, userName: name);
      state = SignUpOtpRequested(email, password);
      return;
    } catch (error) {
      state = SignUpErrorState(error.toString());
      return;
    }
  }

  Future<void> verifyAccount(String email, String otp, String password) async {
    try {
      state = SignUpLoadingState();
      await ref.read(authServiceProvider).verifyAccount(
          verifcationCode: otp, email: email, password: password);
      await _onAuthSuccess();
      state = SignUpSuccessState();
    } catch (e) {
      state = SignUpErrorState(e.toString());
      return;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      state = SignUpLoadingState();
      await ref
          .read(authServiceProvider)
          .logInWithEmailPassword(email: email, password: password);
      await _onAuthSuccess();
      state = SignUpSuccessState();
    } catch (e) {
      state = SignUpErrorState(e.toString());
      return;
    }
  }

  Future<void> signout() async {
    try {
      final isSuccess = await ref.read(sessionManagerProvider).signOutDevice();
      if (isSuccess) {
        ref.read(appFlowStateProvider.notifier).updateState(AppStateGuest());
      } else {
        throw 'Failed to signout current user';
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  Future<void> _onAuthSuccess() async {
    final user = await ref.read(clientProvider).user.currentUser();
    ref.read(appFlowStateProvider.notifier).updateState(
          user == null ? AppStateGuest() : AppStateSuccess(user),
        );
  }
}
