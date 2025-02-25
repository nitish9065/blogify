import '../generated/protocol.dart';

extension UserExtension on AppUser {
  UserDto get toDto {
    return UserDto(
      id: id!,
      name: userInfo?.userName ?? 'Unknown',
      profileUrl: userInfo?.imageUrl
              ?.replaceFirst('localhost', '192.168.1.17') ??
          'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg?20200418092106',
      bio: bio,
    );
  }
}

extension CategoryExtension on Category {
  CategoryDto get toDto {
    return CategoryDto(
      id: id!,
      name: name,
      icon: icon,
      postCount: blogs?.length ?? 0,
    );
  }
}

extension TagExtension on Tag {
  TagDto get toDto {
    return TagDto(
      id: id!,
      name: name,
      postCount: blogs?.length ?? 0,
    );
  }
}
