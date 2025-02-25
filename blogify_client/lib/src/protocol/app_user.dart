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
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i2;
import 'blog.dart' as _i3;
import 'comment.dart' as _i4;
import 'member..dart' as _i5;

abstract class AppUser implements _i1.SerializableModel {
  AppUser._({
    this.id,
    required this.userInfoId,
    this.userInfo,
    required this.bio,
    this.blogs,
    this.comments,
    this.followers,
    this.followings,
  });

  factory AppUser({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    required String bio,
    List<_i3.Blog>? blogs,
    List<_i4.Comment>? comments,
    List<_i5.Member>? followers,
    List<_i5.Member>? followings,
  }) = _AppUserImpl;

  factory AppUser.fromJson(Map<String, dynamic> jsonSerialization) {
    return AppUser(
      id: jsonSerialization['id'] as int?,
      userInfoId: jsonSerialization['userInfoId'] as int,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['userInfo'] as Map<String, dynamic>)),
      bio: jsonSerialization['bio'] as String,
      blogs: (jsonSerialization['blogs'] as List?)
          ?.map((e) => _i3.Blog.fromJson((e as Map<String, dynamic>)))
          .toList(),
      comments: (jsonSerialization['comments'] as List?)
          ?.map((e) => _i4.Comment.fromJson((e as Map<String, dynamic>)))
          .toList(),
      followers: (jsonSerialization['followers'] as List?)
          ?.map((e) => _i5.Member.fromJson((e as Map<String, dynamic>)))
          .toList(),
      followings: (jsonSerialization['followings'] as List?)
          ?.map((e) => _i5.Member.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userInfoId;

  _i2.UserInfo? userInfo;

  String bio;

  List<_i3.Blog>? blogs;

  List<_i4.Comment>? comments;

  List<_i5.Member>? followers;

  /// Followings of the user
  List<_i5.Member>? followings;

  AppUser copyWith({
    int? id,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    String? bio,
    List<_i3.Blog>? blogs,
    List<_i4.Comment>? comments,
    List<_i5.Member>? followers,
    List<_i5.Member>? followings,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
      'bio': bio,
      if (blogs != null) 'blogs': blogs?.toJson(valueToJson: (v) => v.toJson()),
      if (comments != null)
        'comments': comments?.toJson(valueToJson: (v) => v.toJson()),
      if (followers != null)
        'followers': followers?.toJson(valueToJson: (v) => v.toJson()),
      if (followings != null)
        'followings': followings?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AppUserImpl extends AppUser {
  _AppUserImpl({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    required String bio,
    List<_i3.Blog>? blogs,
    List<_i4.Comment>? comments,
    List<_i5.Member>? followers,
    List<_i5.Member>? followings,
  }) : super._(
          id: id,
          userInfoId: userInfoId,
          userInfo: userInfo,
          bio: bio,
          blogs: blogs,
          comments: comments,
          followers: followers,
          followings: followings,
        );

  @override
  AppUser copyWith({
    Object? id = _Undefined,
    int? userInfoId,
    Object? userInfo = _Undefined,
    String? bio,
    Object? blogs = _Undefined,
    Object? comments = _Undefined,
    Object? followers = _Undefined,
    Object? followings = _Undefined,
  }) {
    return AppUser(
      id: id is int? ? id : this.id,
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
      bio: bio ?? this.bio,
      blogs: blogs is List<_i3.Blog>?
          ? blogs
          : this.blogs?.map((e0) => e0.copyWith()).toList(),
      comments: comments is List<_i4.Comment>?
          ? comments
          : this.comments?.map((e0) => e0.copyWith()).toList(),
      followers: followers is List<_i5.Member>?
          ? followers
          : this.followers?.map((e0) => e0.copyWith()).toList(),
      followings: followings is List<_i5.Member>?
          ? followings
          : this.followings?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
