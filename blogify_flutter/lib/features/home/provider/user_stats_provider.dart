import 'package:blogify_client/blogify_client.dart';
import 'package:blogify_flutter/core/provider/app_state_provider.dart';
import 'package:blogify_flutter/core/provider/client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final userStatsProvider =
    StreamProvider.autoDispose.family<UserStats, int>((ref, int userId) async* {
  try {
    final stats = ref.read(clientProvider).user.getStats(userId);
    await for (var data in stats) {
      yield data;
    }
  } catch (e) {
    throw ServerException(
      message: 'Failed to load user stats',
    );
  }
});

final userFollowingStatusProvider =
    StreamProvider.autoDispose.family<UserFollowingStat, int>(
  (ref, int subscribedToUserId) async* {
    try {
      final stats = ref.read(clientProvider).user.isUserFollowing(
            (ref.watch(appFlowStateProvider) as AppStateSuccess).user.id,
            subscribedToUserId,
          );
      await for (var data in stats) {
        yield data;
      }
    } catch (e) {
      throw ServerException(
        message: 'Failed to load user stats',
      );
    }
  },
);

final blogCountProvider = StreamProvider.family<int, PostStatus>(
  (ref, PostStatus status) async* {
    final blogCountStat = ref.read(clientProvider).blog.streamBlogCount(status);
    await for (var stats in blogCountStat) {
      yield stats.count;
    }
  },
);
