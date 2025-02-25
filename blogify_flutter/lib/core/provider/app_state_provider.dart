import 'package:blogify_client/blogify_client.dart';
import 'package:blogify_flutter/core/provider/client_provider.dart';
import 'package:blogify_flutter/core/provider/session_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_state_provider.g.dart';

@riverpod
class AppFlowState extends _$AppFlowState {
  @override
  Appstate build() {
    init();
    return AppStateInitial();
  }

  Future<void> init() async {
    try {
      state = AppStateBooting();
      await Future.delayed(const Duration(seconds: 2));
      await ref.read(sessionManagerProvider).initialize();
      final user = await ref.read(clientProvider).user.currentUser();
      state = user == null ? AppStateGuest() : AppStateSuccess(user);
    } catch (e) {
      state = AppStateError(e.toString());
    }
    return;
  }

  void updateState(Appstate appState) {
    state = appState;
  }
}

sealed class Appstate {}

class AppStateInitial extends Appstate {}

class AppStateBooting extends Appstate {}

class AppStateGuest extends Appstate {}

class AppStateSuccess extends Appstate {
  final UserDto user;

  AppStateSuccess(this.user);

  @override
  String toString() {
    return user.toString();
  }
}

class AppStateError extends Appstate {
  final String error;

  AppStateError(this.error);
}
