// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blogify_client/blogify_client.dart';

class EmptyCategoryFeed implements CategoryDto {
  @override
  int id;

  @override
  String name;

  @override
  String? icon;

  @override
  int postCount;

  EmptyCategoryFeed({
    this.id = 0,
    this.name = '',
    this.postCount = 0,
  });

  @override
  CategoryDto copyWith({int? id, String? name, int? postCount, String? icon}) {
    return CategoryDto(id: 0, name: '', postCount: 0, icon: icon);
  }

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}
