
import 'package:blogify_flutter/core/data/auth_service.dart';
import 'package:blogify_flutter/core/provider/client_provider.dart';
import 'package:blogify_flutter/core/provider/session_provider.dart';
import 'package:blogify_flutter/features/auth/service/auth_service_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = Provider<AuthService>(
  (ref) {
    return AuthServiceImpl(
      ref.read(clientProvider),
      ref.watch(sessionManagerProvider),
    );
  },
);
