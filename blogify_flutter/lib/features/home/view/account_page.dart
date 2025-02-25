// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blogify_client/blogify_client.dart';
import 'package:blogify_flutter/core/provider/app_state_provider.dart';
import 'package:blogify_flutter/core/widgets/tappable.dart';
import 'package:blogify_flutter/features/home/models/user_blog_parameters.dart';
import 'package:blogify_flutter/features/home/provider/user_stats_provider.dart';
import 'package:blogify_flutter/features/home/view/pages/user_blog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:blogify_flutter/core/extensions/num_duration_extension.dart';
import 'package:blogify_flutter/core/extensions/context_extension.dart';
import 'package:blogify_flutter/core/theme/app_color.dart';
import 'package:blogify_flutter/core/widgets/app_constrained_scroll_view.dart';
import 'package:blogify_flutter/features/auth/auth_page.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  static String get route => '/account';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey.withValues(alpha: 0.15),
      appBar: AppBar(
        title: Text(
          'Profile',
          style: context.textTheme.headlineSmall?.copyWith(
            color: AppColor.whiteColor,
          ),
        ),
        centerTitle: false,
      ),
      body: AppConstrainedScrollView(
        child: Column(
          spacing: 16.0,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final accountInfo = ref.watch(appFlowStateProvider);
                if (accountInfo is AppStateSuccess) {
                  return Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 24.0,
                      children: [
                        // User Header....
                        ColoredBox(
                          color: AppColor.backgroundColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              spacing: 10.0,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  spacing: 16.0,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 42.0,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(84.0),
                                        child: Image.network(
                                          accountInfo.user.profileUrl,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Consumer(
                                        builder: (context, ref, child) {
                                          return ref
                                              .watch(
                                                userStatsProvider(
                                                  accountInfo.user.id,
                                                ),
                                              )
                                              .when(
                                                data: (userStats) {
                                                  return SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      spacing: 16.0,
                                                      children: [
                                                        UserStat(
                                                          title: userStats
                                                              .blogCount
                                                              .compact,
                                                          description: 'Blogs',
                                                          onTap: () {
                                                            final path =
                                                                UserBlogPage.route(
                                                                    id: accountInfo
                                                                        .user
                                                                        .id);
                                                            context.push(
                                                              path,
                                                              extra:
                                                                  UserBlogParameters(
                                                                accountInfo
                                                                    .user.name,
                                                                PostStatus
                                                                    .published,
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                        UserStat(
                                                          title: userStats
                                                              .followersCount
                                                              .compact,
                                                          description:
                                                              'Followers',
                                                        ),
                                                        UserStat(
                                                          title: userStats
                                                              .followingCount
                                                              .compact,
                                                          description:
                                                              'Followings',
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                                error: (error, stackTrace) =>
                                                    const Center(
                                                  child: Text(
                                                      'Error fetching user stats'),
                                                ),
                                                loading: () => Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: AppColor
                                                        .mainApppurpleColor,
                                                  ),
                                                ),
                                              );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Flexible(
                                  child: Text(
                                    accountInfo.user.name,
                                    style: context.textTheme.bodyLarge,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    accountInfo.user.bio ?? '',
                                    style:
                                        context.textTheme.bodyMedium?.copyWith(
                                      color: AppColor.blackColor.withValues(
                                        alpha: 0.8,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  spacing: 16.0,
                                  children: [
                                    Expanded(
                                      child: OutlinedButton.icon(
                                        icon: const Icon(Icons.edit_outlined),
                                        onPressed: () {},
                                        label: const Text('Edit Profile'),
                                      ),
                                    ),
                                    Expanded(
                                      child: OutlinedButton.icon(
                                        icon: const Icon(Icons.share_outlined),
                                        onPressed: () async {
                                          await showAdaptiveDialog(
                                            barrierDismissible: false,
                                            context: context,
                                            builder: (context) =>
                                                AlertDialog.adaptive(
                                              contentPadding:
                                                  const EdgeInsets.all(16.0),
                                              content: SizedBox(
                                                height: context.height * 0.5,
                                                width: context.width * 0.75,
                                                child: Column(
                                                  spacing: 8.0,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      'Share QR',
                                                      style: context.textTheme
                                                          .headlineLarge,
                                                    ),
                                                    const Divider(
                                                      color: AppColor
                                                          .blackColorFaded,
                                                      thickness: 0.25,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        label: const Text('Share Profile'),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Tiles for draft & posts..
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomTile(
                              title: 'Drafts',
                              icon: Icons.drafts_outlined,
                              trailing: ref
                                  .watch(blogCountProvider(PostStatus.draft))
                                  .whenData(
                                    (value) => value == 0
                                        ? const SizedBox.shrink()
                                        : CircleAvatar(
                                            maxRadius: 16.0,
                                            backgroundColor: AppColor.grey
                                                .withValues(alpha: 0.2),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                value.compact,
                                                style:
                                                    context.textTheme.bodySmall,
                                              ),
                                            ),
                                          ),
                                  )
                                  .value,
                              onTap: () {
                                final path =
                                    UserBlogPage.route(id: accountInfo.user.id);
                                context.push(
                                  path,
                                  extra: UserBlogParameters(
                                    accountInfo.user.name,
                                    PostStatus.draft,
                                  ),
                                );
                              },
                            ),
                            CustomTile(
                              title: 'Scheduled',
                              icon: Icons.schedule_outlined,
                              trailing: ref
                                  .watch(
                                      blogCountProvider(PostStatus.scheduled))
                                  .whenData(
                                    (value) => value == 0
                                        ? const SizedBox.shrink()
                                        : CircleAvatar(
                                            maxRadius: 16.0,
                                            backgroundColor: AppColor.grey
                                                .withValues(alpha: 0.2),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                value.compact,
                                                style:
                                                    context.textTheme.bodySmall,
                                              ),
                                            ),
                                          ),
                                  )
                                  .value,
                              onTap: () {
                                final path =
                                    UserBlogPage.route(id: accountInfo.user.id);
                                context.push(
                                  path,
                                  extra: UserBlogParameters(
                                    accountInfo.user.name,
                                    PostStatus.scheduled,
                                  ),
                                );
                              },
                            ),
                            CustomTile(
                              title: 'Saved Blogs',
                              icon: Icons.bookmark_border_rounded,
                              onTap: () {},
                            ),
                            CustomTile(
                              title: 'Downloads',
                              icon: Icons.download_done_rounded,
                              onTap: () {},
                            ),
                            CustomTile(
                              title: 'Settings',
                              icon: Icons.settings,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
                return const Expanded(child: UnauthenticatedAccountSection());
              },
            ),
            const AccountHelperTiles()
          ],
        ),
      ),
    );
  }
}

class UserStat extends StatelessWidget {
  const UserStat(
      {super.key, this.onTap, required this.title, required this.description});
  final String title;
  final String description;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Tappable(
      animationEffect: TappableAnimationEffect.fade,
      throttle: true,
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 4.0,
        children: [
          Flexible(
            child: Text(
              title,
              style: context.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColor.blackColor.withValues(alpha: 0.85),
              ),
            ),
          ),
          Text(
            description,
            style: context.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}

class BannerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = const LinearGradient(
        colors: [AppColor.primary, AppColor.whiteColor],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.1,
        size.width * 0.5, size.height * 0.3);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.5, size.width, size.height * 0.2);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class UnauthenticatedAccountSection extends StatelessWidget {
  const UnauthenticatedAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: AppColor.backgroundColor.withValues(alpha: 0.7),
          height: context.height * 0.15,
          child: Stack(
            clipBehavior: Clip.antiAlias,
            children: [
              Container(
                height: context.height * 0.06,
                color: AppColor.mainApppurpleColor,
              ),
              Positioned(
                top: context.height * 0.0015,
                left: 20.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  spacing: 56.0,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: AppColor.backgroundColor,
                        border: Border.all(
                          color: AppColor.blackColorFaded,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.person_2_outlined,
                        size: 84.0,
                        color: AppColor.blackColorFaded,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.push(AuthPage.route);
                      },
                      child: const Text('LOGIN/SIGNUP'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: AppColor.mainApppurpleColor,
            child: CustomPaint(
              painter: BannerPainter(),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    top: 16.0,
                    left: 16.0,
                    child: RichText(
                      text: const TextSpan(
                        text: 'You\n\t\t\t\t\t\t',
                        style: TextStyle(
                          fontSize: 48.0,
                          fontWeight: FontWeight.bold,
                          color: AppColor.backgroundColor,
                          fontFamily: 'Cera Pro',
                        ),
                        children: [
                          TextSpan(
                            text: 'are\nmissing a ',
                            children: [
                              TextSpan(
                                text: 'lot!\n',
                                style: TextStyle(
                                  fontSize: 62.0,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.backgroundColor,
                                  fontFamily: 'Cera Pro',
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16.0,
                    left: 16.0,
                    right: 0,
                    child: Text(
                      'Login now to explore more 🤓 🤓',
                      textAlign: TextAlign.justify,
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: AppColor.backgroundColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AccountHelperTiles extends StatelessWidget {
  const AccountHelperTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTile(
          title: 'Help',
          icon: Icons.help_outline_outlined,
          onTap: () {},
        ),
        CustomTile(
          title: 'About Us',
          icon: Icons.info_outline_rounded,
          onTap: () {},
        ),
        CustomTile(
          title: 'Terms Of Use',
          icon: Icons.settings_accessibility_outlined,
          onTap: () {},
        ),
        CustomTile(
          title: 'Privacy Policy',
          icon: Icons.privacy_tip_outlined,
          onTap: () {},
        ),
      ],
    );
  }
}

class CustomTile extends StatelessWidget {
  const CustomTile({
    super.key,
    required this.title,
    required this.icon,
    this.trailing,
    this.onTap,
  });
  final String title;
  final IconData icon;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: AppColor.backgroundColor,
      splashColor: AppColor.whiteColor,
      leading: Icon(
        icon,
        color: AppColor.blackColor.withValues(
          alpha: 0.7,
        ),
        size: 24.0,
      ),
      title: Text(
        title,
        style: context.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColor.blackColor.withValues(
            alpha: 0.7,
          ),
        ),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
