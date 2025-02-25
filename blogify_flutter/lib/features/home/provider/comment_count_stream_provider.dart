import 'dart:developer';

import 'package:blogify_flutter/core/provider/client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final commentCountProvider =
    StreamProvider.autoDispose.family<int, int>((ref, int postId) async* {
  try {
    final stream =
        ref.read(clientProvider).comment.streamCommentCountOfPost(postId);
    await for (var count in stream) {
      yield count.count;
    }
  } catch (e) {
    log('Error occured while streaming comment counts for postId $postId');
  }
});
