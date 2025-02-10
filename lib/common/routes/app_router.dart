import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spallawebapp/common/navigation/navigation_cubit.dart';
import 'package:spallawebapp/infrastructure/services/navigation/navigation_service.dart';
import 'package:spallawebapp/infrastructure/services/shared_preferences/shared_preferences_service.dart';
import 'package:spallawebapp/presentation/views/spacad/cadastro_cliente/cadastro_cliente_view.dart';
import 'package:spallawebapp/presentation/views/spacom/vendas/vendas_view.dart';
import 'package:spallawebapp/presentation/views/web_app/dashboard/dashboard_view.dart';
import 'package:spallawebapp/presentation/views/web_app/home/home_view.dart';
import 'package:spallawebapp/presentation/views/web_app/not_found/not_found_view.dart';
import 'package:spallawebapp/presentation/views/web_app/profile/profile_view.dart';
import 'package:spallawebapp/presentation/views/web_app/settings/settings_view.dart';

class AppRoutesNames {
  static const root = '/';
  static const homeNamedPage = '/home';
  static const homeDetailsNamedPage = 'details';
  static const profileNamedPage = '/profile';
  static const profileDetailsNamedPage = 'details';
  static const settingsNamedPage = '/settings';
  static const cadastroClientesNamedPage = '/cadastro-clientes';
  static const vendasNamedPage = '/vendas';

  static Widget errorWidget(BuildContext context, GoRouterState state) {
    return const PageNotFoundView();
  }
}

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final navigationService =
      NavigationService(SharedPreferencesService());

  static final GoRouter _router = GoRouter(
    initialLocation: AppRoutesNames.root,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return BlocProvider(
            create: (context) => NavigationCubit(navigationService),
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
          ),
          GoRoute(
            path: AppRoutesNames.profileNamedPage,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: ProfileView(),
              );
            },
          ),
          GoRoute(
            path: AppRoutesNames.settingsNamedPage,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: SettingsView(),
              );
            },
          ),
          GoRoute(
            path: AppRoutesNames.cadastroClientesNamedPage,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: CadastroClienteView(),
              );
            },
          ),
          GoRoute(
            path: AppRoutesNames.vendasNamedPage,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: VendasView(),
              );
            },
          ),
        ],
      ),
    ],
    errorBuilder: AppRoutesNames.errorWidget,
  );

  static GoRouter get router => _router;
}
