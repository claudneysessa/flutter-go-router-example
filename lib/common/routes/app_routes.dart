import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:spallawebapp/common/navigation/navigation_cubit.dart';
import 'package:spallawebapp/presentation/pages/home/home_details_screen.dart';
import 'package:spallawebapp/presentation/pages/home/home_screen.dart';
import 'package:spallawebapp/presentation/dashboard/dashboard_view.dart';
import 'package:spallawebapp/presentation/pages/profile/profile_details_screen.dart';
import 'package:spallawebapp/presentation/pages/profile/profile_screen.dart';
import 'package:spallawebapp/presentation/pages/settings/settings_screen.dart';

import 'constants.dart';
import '../pages/not_found/not_found_page.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    initialLocation: Routes.homeNamedPage,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return BlocProvider(
            create: (context) {
              return NavigationCubit();
            },
            child: DashboardView(
              currentPageWidget: child,
            ),
          );
        },
        routes: [
          GoRoute(
            path: Routes.homeNamedPage,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: HomeScreen(),
              );
            },
            routes: [
              GoRoute(
                path: Routes.homeDetailsNamedPage,
                builder: (context, state) {
                  return const HomeDetailsScreen();
                },
              ),
            ],
          ),
          GoRoute(
            path: Routes.profileNamedPage,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: ProfileScreen(),
              );
            },
            routes: [
              GoRoute(
                path: Routes.profileDetailsNamedPage,
                builder: (context, state) {
                  return const ProfileDetailsScreen();
                },
              ),
            ],
          ),
          GoRoute(
            path: Routes.settingsNamedPage,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: SettingScreen(),
              );
            },
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) {
      return const NotFoundScreen();
    },
  );

  static GoRouter get router => _router;
}
