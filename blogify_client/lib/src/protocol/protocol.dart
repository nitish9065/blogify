/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dtos/blog_count_by_status_dto.dart' as _i2;
import 'dtos/blog_sto.dart' as _i3;
import 'dtos/category_dto.dart' as _i4;
import 'dtos/comment_count_value_dto.dart' as _i5;
import 'dtos/comment_dto.dart' as _i6;
import 'dtos/create_blog_dto.dart' as _i7;
import 'dtos/paginated_blog_dto.dart' as _i8;
import 'dtos/paginated_category_dto.dart' as _i9;
import 'dtos/paginated_comment.dart' as _i10;
import 'dtos/paginated_tag_dto.dart' as _i11;
import 'dtos/server_exception.dart' as _i12;
import 'dtos/tag_dto.dart' as _i13;
import 'dtos/user_dto.dart' as _i14;
import 'dtos/user_following_stat.dart' as _i15;
import 'dtos/user_stats.dart' as _i16;
import 'app_user.dart' as _i17;
import 'blog.dart' as _i18;
import 'blog_tag.dart' as _i19;
import 'category.dart' as _i20;
import 'comment.dart' as _i21;
import 'example.dart' as _i22;
import 'member..dart' as _i23;
import 'post_status.dart' as _i24;
import 'tag.dart' as _i25;
import 'package:blogify_client/src/protocol/dtos/blog_sto.dart' as _i26;
import 'package:blogify_client/src/protocol/dtos/category_dto.dart' as _i27;
import 'package:blogify_client/src/protocol/dtos/tag_dto.dart' as _i28;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i29;
export 'dtos/blog_count_by_status_dto.dart';
export 'dtos/blog_sto.dart';
export 'dtos/category_dto.dart';
export 'dtos/comment_count_value_dto.dart';
export 'dtos/comment_dto.dart';
export 'dtos/create_blog_dto.dart';
export 'dtos/paginated_blog_dto.dart';
export 'dtos/paginated_category_dto.dart';
export 'dtos/paginated_comment.dart';
export 'dtos/paginated_tag_dto.dart';
export 'dtos/server_exception.dart';
export 'dtos/tag_dto.dart';
export 'dtos/user_dto.dart';
export 'dtos/user_following_stat.dart';
export 'dtos/user_stats.dart';
export 'app_user.dart';
export 'blog.dart';
export 'blog_tag.dart';
export 'category.dart';
export 'comment.dart';
export 'example.dart';
export 'member..dart';
export 'post_status.dart';
export 'tag.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.BlogCountByStatusDto) {
      return _i2.BlogCountByStatusDto.fromJson(data) as T;
    }
    if (t == _i3.BlogDto) {
      return _i3.BlogDto.fromJson(data) as T;
    }
    if (t == _i4.CategoryDto) {
      return _i4.CategoryDto.fromJson(data) as T;
    }
    if (t == _i5.CommentCountStream) {
      return _i5.CommentCountStream.fromJson(data) as T;
    }
    if (t == _i6.CommentDto) {
      return _i6.CommentDto.fromJson(data) as T;
    }
    if (t == _i7.CreateBlogDto) {
      return _i7.CreateBlogDto.fromJson(data) as T;
    }
    if (t == _i8.PaginatedBlogDto) {
      return _i8.PaginatedBlogDto.fromJson(data) as T;
    }
    if (t == _i9.PaginatedCategoryDto) {
      return _i9.PaginatedCategoryDto.fromJson(data) as T;
    }
    if (t == _i10.PaginatedComments) {
      return _i10.PaginatedComments.fromJson(data) as T;
    }
    if (t == _i11.PaginatedTagDto) {
      return _i11.PaginatedTagDto.fromJson(data) as T;
    }
    if (t == _i12.ServerException) {
      return _i12.ServerException.fromJson(data) as T;
    }
    if (t == _i13.TagDto) {
      return _i13.TagDto.fromJson(data) as T;
    }
    if (t == _i14.UserDto) {
      return _i14.UserDto.fromJson(data) as T;
    }
    if (t == _i15.UserFollowingStat) {
      return _i15.UserFollowingStat.fromJson(data) as T;
    }
    if (t == _i16.UserStats) {
      return _i16.UserStats.fromJson(data) as T;
    }
    if (t == _i17.AppUser) {
      return _i17.AppUser.fromJson(data) as T;
    }
    if (t == _i18.Blog) {
      return _i18.Blog.fromJson(data) as T;
    }
    if (t == _i19.BlogTag) {
      return _i19.BlogTag.fromJson(data) as T;
    }
    if (t == _i20.Category) {
      return _i20.Category.fromJson(data) as T;
    }
    if (t == _i21.Comment) {
      return _i21.Comment.fromJson(data) as T;
    }
    if (t == _i22.Example) {
      return _i22.Example.fromJson(data) as T;
    }
    if (t == _i23.Member) {
      return _i23.Member.fromJson(data) as T;
    }
    if (t == _i24.PostStatus) {
      return _i24.PostStatus.fromJson(data) as T;
    }
    if (t == _i25.Tag) {
      return _i25.Tag.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.BlogCountByStatusDto?>()) {
      return (data != null ? _i2.BlogCountByStatusDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i3.BlogDto?>()) {
      return (data != null ? _i3.BlogDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.CategoryDto?>()) {
      return (data != null ? _i4.CategoryDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.CommentCountStream?>()) {
      return (data != null ? _i5.CommentCountStream.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.CommentDto?>()) {
      return (data != null ? _i6.CommentDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.CreateBlogDto?>()) {
      return (data != null ? _i7.CreateBlogDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.PaginatedBlogDto?>()) {
      return (data != null ? _i8.PaginatedBlogDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.PaginatedCategoryDto?>()) {
      return (data != null ? _i9.PaginatedCategoryDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i10.PaginatedComments?>()) {
      return (data != null ? _i10.PaginatedComments.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.PaginatedTagDto?>()) {
      return (data != null ? _i11.PaginatedTagDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.ServerException?>()) {
      return (data != null ? _i12.ServerException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.TagDto?>()) {
      return (data != null ? _i13.TagDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.UserDto?>()) {
      return (data != null ? _i14.UserDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.UserFollowingStat?>()) {
      return (data != null ? _i15.UserFollowingStat.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.UserStats?>()) {
      return (data != null ? _i16.UserStats.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.AppUser?>()) {
      return (data != null ? _i17.AppUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.Blog?>()) {
      return (data != null ? _i18.Blog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.BlogTag?>()) {
      return (data != null ? _i19.BlogTag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.Category?>()) {
      return (data != null ? _i20.Category.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.Comment?>()) {
      return (data != null ? _i21.Comment.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.Example?>()) {
      return (data != null ? _i22.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.Member?>()) {
      return (data != null ? _i23.Member.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.PostStatus?>()) {
      return (data != null ? _i24.PostStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.Tag?>()) {
      return (data != null ? _i25.Tag.fromJson(data) : null) as T;
    }
    if (t == List<_i13.TagDto>) {
      return (data as List).map((e) => deserialize<_i13.TagDto>(e)).toList()
          as dynamic;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
    }
    if (t == List<_i3.BlogDto>) {
      return (data as List).map((e) => deserialize<_i3.BlogDto>(e)).toList()
          as dynamic;
    }
    if (t == List<_i4.CategoryDto>) {
      return (data as List).map((e) => deserialize<_i4.CategoryDto>(e)).toList()
          as dynamic;
    }
    if (t == List<_i6.CommentDto>) {
      return (data as List).map((e) => deserialize<_i6.CommentDto>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<_i18.Blog>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i18.Blog>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i21.Comment>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i21.Comment>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i23.Member>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i23.Member>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i23.Member>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i23.Member>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i19.BlogTag>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i19.BlogTag>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i21.Comment>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i21.Comment>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i18.Blog>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i18.Blog>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i21.Comment>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i21.Comment>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i19.BlogTag>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i19.BlogTag>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i26.BlogDto>) {
      return (data as List).map((e) => deserialize<_i26.BlogDto>(e)).toList()
          as dynamic;
    }
    if (t == List<_i27.CategoryDto>) {
      return (data as List)
          .map((e) => deserialize<_i27.CategoryDto>(e))
          .toList() as dynamic;
    }
    if (t == List<_i28.TagDto>) {
      return (data as List).map((e) => deserialize<_i28.TagDto>(e)).toList()
          as dynamic;
    }
    try {
      return _i29.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.BlogCountByStatusDto) {
      return 'BlogCountByStatusDto';
    }
    if (data is _i3.BlogDto) {
      return 'BlogDto';
    }
    if (data is _i4.CategoryDto) {
      return 'CategoryDto';
    }
    if (data is _i5.CommentCountStream) {
      return 'CommentCountStream';
    }
    if (data is _i6.CommentDto) {
      return 'CommentDto';
    }
    if (data is _i7.CreateBlogDto) {
      return 'CreateBlogDto';
    }
    if (data is _i8.PaginatedBlogDto) {
      return 'PaginatedBlogDto';
    }
    if (data is _i9.PaginatedCategoryDto) {
      return 'PaginatedCategoryDto';
    }
    if (data is _i10.PaginatedComments) {
      return 'PaginatedComments';
    }
    if (data is _i11.PaginatedTagDto) {
      return 'PaginatedTagDto';
    }
    if (data is _i12.ServerException) {
      return 'ServerException';
    }
    if (data is _i13.TagDto) {
      return 'TagDto';
    }
    if (data is _i14.UserDto) {
      return 'UserDto';
    }
    if (data is _i15.UserFollowingStat) {
      return 'UserFollowingStat';
    }
    if (data is _i16.UserStats) {
      return 'UserStats';
    }
    if (data is _i17.AppUser) {
      return 'AppUser';
    }
    if (data is _i18.Blog) {
      return 'Blog';
    }
    if (data is _i19.BlogTag) {
      return 'BlogTag';
    }
    if (data is _i20.Category) {
      return 'Category';
    }
    if (data is _i21.Comment) {
      return 'Comment';
    }
    if (data is _i22.Example) {
      return 'Example';
    }
    if (data is _i23.Member) {
      return 'Member';
    }
    if (data is _i24.PostStatus) {
      return 'PostStatus';
    }
    if (data is _i25.Tag) {
      return 'Tag';
    }
    className = _i29.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'BlogCountByStatusDto') {
      return deserialize<_i2.BlogCountByStatusDto>(data['data']);
    }
    if (dataClassName == 'BlogDto') {
      return deserialize<_i3.BlogDto>(data['data']);
    }
    if (dataClassName == 'CategoryDto') {
      return deserialize<_i4.CategoryDto>(data['data']);
    }
    if (dataClassName == 'CommentCountStream') {
      return deserialize<_i5.CommentCountStream>(data['data']);
    }
    if (dataClassName == 'CommentDto') {
      return deserialize<_i6.CommentDto>(data['data']);
    }
    if (dataClassName == 'CreateBlogDto') {
      return deserialize<_i7.CreateBlogDto>(data['data']);
    }
    if (dataClassName == 'PaginatedBlogDto') {
      return deserialize<_i8.PaginatedBlogDto>(data['data']);
    }
    if (dataClassName == 'PaginatedCategoryDto') {
      return deserialize<_i9.PaginatedCategoryDto>(data['data']);
    }
    if (dataClassName == 'PaginatedComments') {
      return deserialize<_i10.PaginatedComments>(data['data']);
    }
    if (dataClassName == 'PaginatedTagDto') {
      return deserialize<_i11.PaginatedTagDto>(data['data']);
    }
    if (dataClassName == 'ServerException') {
      return deserialize<_i12.ServerException>(data['data']);
    }
    if (dataClassName == 'TagDto') {
      return deserialize<_i13.TagDto>(data['data']);
    }
    if (dataClassName == 'UserDto') {
      return deserialize<_i14.UserDto>(data['data']);
    }
    if (dataClassName == 'UserFollowingStat') {
      return deserialize<_i15.UserFollowingStat>(data['data']);
    }
    if (dataClassName == 'UserStats') {
      return deserialize<_i16.UserStats>(data['data']);
    }
    if (dataClassName == 'AppUser') {
      return deserialize<_i17.AppUser>(data['data']);
    }
    if (dataClassName == 'Blog') {
      return deserialize<_i18.Blog>(data['data']);
    }
    if (dataClassName == 'BlogTag') {
      return deserialize<_i19.BlogTag>(data['data']);
    }
    if (dataClassName == 'Category') {
      return deserialize<_i20.Category>(data['data']);
    }
    if (dataClassName == 'Comment') {
      return deserialize<_i21.Comment>(data['data']);
    }
    if (dataClassName == 'Example') {
      return deserialize<_i22.Example>(data['data']);
    }
    if (dataClassName == 'Member') {
      return deserialize<_i23.Member>(data['data']);
    }
    if (dataClassName == 'PostStatus') {
      return deserialize<_i24.PostStatus>(data['data']);
    }
    if (dataClassName == 'Tag') {
      return deserialize<_i25.Tag>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i29.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
