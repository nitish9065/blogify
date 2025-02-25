import 'dart:developer';

import 'package:blogify_client/blogify_client.dart';
import 'package:blogify_flutter/core/provider/client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final latestTagProvider = FutureProvider.autoDispose<List<TagDto>>((ref) async {
  try {
    final data = await ref.read(clientProvider).tag.paginateTags(4, 1);
    return data.tags;
  } catch (e) {
    log('error fetching data');
  }
  return <TagDto>[];
});

final latestBlogProvider =
    FutureProvider.autoDispose<List<BlogDto>>((ref) async {
  try {
    final data = await ref.read(clientProvider).blog.getLatestBlogs();
    return data;
  } catch (e) {
    log('error fetching data');
  }
  return <BlogDto>[];
});
