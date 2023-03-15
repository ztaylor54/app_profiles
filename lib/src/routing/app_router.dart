import 'package:app_profiles/src/features/profile/presentation/profile_detail_page.dart';
import 'package:app_profiles/src/features/profile/presentation/profile_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'app_page.dart';

/// The navigation router for the application.
class AppRouter {
  /// The navigation routes of the application.
  ///
  /// See [GoRouter] documentation: [GoRouter Docs](https://pub.dev/documentation/go_router/latest/)
  GoRouter get appRoutes {
    // private navigators
    final rootNavigatorKey = GlobalKey<NavigatorState>();
    return GoRouter(
      initialLocation: AppPage.root.path,
      navigatorKey: rootNavigatorKey,
      routes: [
        /// Root page - redirects to profile list.
        GoRoute(
          path: AppPage.root.path,
          name: AppPage.root.name,
          redirect: (_, __) => AppPage.profileList.path,
        ),

        /// Profile list (main dashboard).
        GoRoute(
          path: AppPage.profileList.path,
          name: AppPage.profileList.name,
          builder: (context, state) => const ProfileListPage(),
          routes: [
            /// Profile detail page.
            GoRoute(
              path: AppPage.profileDetail.path,
              name: AppPage.profileDetail.name,
              builder: (context, state) => ProfileDetailPage(
                profileId: state.params['profileId']!,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Provider for the app router.
final appRouterProvider = Provider<AppRouter>((ref) {
  final router = AppRouter();
  return router;
});
