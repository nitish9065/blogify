import 'package:blogify_server/src/generated/protocol.dart';
import 'package:blogify_server/src/utils/user_extension.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class UserEndpoint extends Endpoint {
  static const userChannel = '/users';
  static const statsChannel = '/stats';

  Future<bool> isEmailAvailable(Session session, String email) async {
    try {
      var userInfo = await AppUser.db.findFirstRow(
        session,
        where: (p0) => p0.userInfo.email.equals(email),
      );
      return userInfo == null;
    } catch (e) {
      session.log('Failed to check email credentials ${e.toString()}');
      return false;
    }
  }

  Future<UserDto?> currentUser(Session session) async {
    try {
      final authInfo = await session.authenticated;
      if (authInfo == null) {
        return null;
      }
      final userId = authInfo.userId;
      final user = await AppUser.db.findFirstRow(
        session,
        where: (p0) => p0.userInfo.id.equals(userId),
        include: AppUser.include(
          userInfo: UserInfo.include(),
        ),
      );
      return user?.toDto;
    } catch (e, stackTrace) {
      session.log('Failed to check current user credentials ${e.toString()}');
      throw ServerException(
        message: 'Error occured while checking for current user',
        error: e.toString(),
        stackTrace: stackTrace.toString(),
      );
    }
  }

  Stream<UserStats> getStats(Session session, int userId) async* {
    try {
      var statsStream = session.messages
          .createStream<UserStats>('$userChannel/$userId$statsChannel');
      final userStats = await getUserStats(session, userId);
      yield userStats;
      await for (var stats in statsStream) {
        yield stats;
      }
    } catch (e, stackTrace) {
      session.log(
          'Failed to stream suer stats for user with userId $userId ${e.toString()}');
      throw ServerException(
        message: 'Error occured while streaming user stats',
        error: e.toString(),
        stackTrace: stackTrace.toString(),
      );
    }
  }

  Future<UserStats> getUserStats(Session session, int userId) async {
    try {
      final followingCount = await Member.db.count(
        session,
        where: (p0) => p0.subscriberId.equals(userId),
      );
      final followersCount = await Member.db.count(
        session,
        where: (p0) => p0.subscribedToId.equals(userId),
      );
      final blogCount = await Blog.db.count(
        session,
        where: (p0) =>
            p0.authorId.equals(userId) &
            p0.status.equals(
              PostStatus.published,
            ),
      );

      final updatedStats = UserStats(
        userId: userId,
        followersCount: followersCount,
        followingCount: followingCount,
        blogCount: blogCount,
      );
      return updatedStats;
    } catch (e, stackTrace) {
      session.log(
          'Failed to get suer stats for user with userId $userId ${e.toString()}');
      throw ServerException(
        message: 'Error occured while getting user stats',
        error: e.toString(),
        stackTrace: stackTrace.toString(),
      );
    }
  }

  Future<void> followUnfollowUser(
      Session session, int subscriberId, int subscribedToId) async {
    try {
      // Perform the follow action (add to database, etc.)
      var isAlreadyFollowing = await Member.db.findFirstRow(
        session,
        where: (member) =>
            member.subscriberId.equals(subscriberId) &
            member.subscribedToId.equals(subscribedToId),
      );
      if (isAlreadyFollowing != null) {
        //unfollow the user...
        await Member.db.deleteRow(session, isAlreadyFollowing);
      } else {
        // follow the user...
        await Member.db.insertRow(
          session,
          Member(subscriberId: subscriberId, subscribedToId: subscribedToId),
        );
      }

      // Update stats for both users
      await _updateUserStats(session, subscriberId);
      await _updateUserStats(session, subscribedToId);
      await _updateUserFollowingOrNotStatus(
          session, subscriberId, subscribedToId);
    } catch (e, stackTrace) {
      session.log(
        'Failed to follow user: ${e.toString()}',
        level: LogLevel.error,
        exception: e,
        stackTrace: stackTrace,
      );
      throw ServerException(
        message: 'Error occurred while following user',
        error: e.toString(),
        stackTrace: stackTrace.toString(),
      );
    }
  }

  Stream<UserFollowingStat> isUserFollowing(
      Session session, int subscriberId, int subscribedToId) async* {
    try {
      var streamChannel = session.messages.createStream<UserFollowingStat>(
          '$userChannel/$subscriberId/isFollowing/$subscribedToId');
      var isAlreadyFollowing = await Member.db.findFirstRow(
        session,
        where: (member) =>
            member.subscriberId.equals(subscriberId) &
            member.subscribedToId.equals(subscribedToId),
      );
      yield UserFollowingStat(isFollowing: isAlreadyFollowing != null);
      await for (var data in streamChannel) {
        yield data;
      }
    } catch (e, stackTrace) {
      session.log('Failed to stream the following status for user');
      throw ServerException(
        message: 'Error occured while streaming user follow/following status',
        error: e.toString(),
        stackTrace: stackTrace.toString(),
      );
    }
  }

  Future<void> _updateUserStats(Session session, int userId) async {
    final updatedStats = await getUserStats(session, userId);
    // Post the updated stats to the user's stream
    await session.messages
        .postMessage('$userChannel/$userId$statsChannel', updatedStats);
  }

  Future<void> _updateUserFollowingOrNotStatus(
      Session session, int subscriberId, int subscribedToId) async {
    var isAlreadyFollowing = await Member.db.findFirstRow(
      session,
      where: (member) =>
          member.subscriberId.equals(subscriberId) &
          member.subscribedToId.equals(subscribedToId),
    );
    session.messages.postMessage(
      '$userChannel/$subscriberId/isFollowing/$subscribedToId',
      UserFollowingStat(isFollowing: isAlreadyFollowing != null),
    );
  }
}
