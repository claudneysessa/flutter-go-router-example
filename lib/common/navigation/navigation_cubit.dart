import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spallawebapp/common/navigation/navigation_state.dart';
import 'package:spallawebapp/common/routes/app_router.dart';
import 'package:spallawebapp/domain/interfaces/i_navigation_service.dart';

class NavigationCubit extends Cubit<NavigationState> {
  final INavigationService _navigationService;

  NavigationCubit(this._navigationService)
      : super(const NavigationState(
          bottomNavItems: AppRoutesNames.homeNamedPage,
          permissionKey: 'home',
        )) {
    _loadState();
  }

  Future<void> _loadState() async {
    final permissionKey =
        await _navigationService.getCurrentPermissionKey() ?? 'home';
    getNavBarItem(permissionKey);
  }

  void getNavBarItem(String permissionKey) async {
    // Primeiro salva a permissão
    await _navigationService.savePermissionKey(permissionKey);

    // Depois obtém a rota correspondente
    final route = _navigationService.getRouteByPermission(permissionKey) ??
        AppRoutesNames.homeNamedPage;

    // Por fim, emite o novo estado
    emit(NavigationState(
      bottomNavItems: route,
      permissionKey: permissionKey,
    ));
  }
}
