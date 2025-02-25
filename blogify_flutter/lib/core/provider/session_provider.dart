import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import 'client_provider.dart';

part 'session_provider.g.dart';

@Riverpod(keepAlive: true)
SessionManager sessionManager(Ref ref) {
  return SessionManager(
    caller: ref.read(clientProvider).modules.auth,
  );
}
