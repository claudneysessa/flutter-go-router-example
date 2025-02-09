import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spallawebapp/presentation/views/dashboard/dashboard_view.dart';
import 'package:spallawebapp/presentation/views/home/home_detail_view.dart';
import 'package:spallawebapp/presentation/views/home/home_view.dart';
import 'package:spallawebapp/common/navigation/navigation_cubit.dart';
import 'package:spallawebapp/presentation/views/not_found/not_found_view.dart';
import 'package:spallawebapp/presentation/views/profile/profile_detail_view.dart';
import 'package:spallawebapp/presentation/views/profile/profile_view.dart';
import 'package:spallawebapp/presentation/views/settings/settings_view.dart';

class AppRoutesNames {
  static const root = '/';
  static const homeNamedPage = '/home';
  static const homeDetailsNamedPage = 'details';
  static const profileNamedPage = '/profile';
  static const profileDetailsNamedPage = 'details';
  static const settingsNamedPage = '/settings';

  static Widget errorWidget(BuildContext context, GoRouterState state) {
    return const PageNotFoundView();
  }
}

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    initialLocation: AppRoutesNames.root,
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
            path: AppRoutesNames.root,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: HomeView(),
              );
            },
          ),
          GoRoute(
            path: AppRoutesNames.homeNamedPage,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: HomeView(),
              );
            },
            routes: [
              GoRoute(
                path: AppRoutesNames.homeDetailsNamedPage,
                builder: (context, state) {
                  return const HomeDetailView();
                },
              ),
            ],
          ),
          GoRoute(
            path: AppRoutesNames.profileNamedPage,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: ProfileView(),
              );
            },
            routes: [
              GoRoute(
                path: AppRoutesNames.profileDetailsNamedPage,
                builder: (context, state) {
                  return const ProfileDetailView();
                },
              ),
            ],
          ),
          GoRoute(
            path: AppRoutesNames.settingsNamedPage,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: SettingsView(),
              );
            },
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) {
      return const PageNotFoundView();
    },
  );

  static GoRouter get router => _router;
}
