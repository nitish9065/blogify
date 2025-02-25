// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blogify_client/blogify_client.dart';

class EmptyTagFeed implements TagDto {
  @override
  int id;

  @override
  String name;

  @override
  int postCount;

  EmptyTagFeed({
    this.id = 0,
    this.name = '',
    this.postCount = 0,
  });

  @override
  TagDto copyWith({int? id, String? name, int? postCount}) {
    return TagDto(id: 0, name: '', postCount: 0);
  }

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}
