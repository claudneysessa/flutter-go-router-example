import 'package:flutter/material.dart';
import 'package:spallawebapp/common/routes/app_router.dart';
import 'package:spallawebapp/domain/interfaces/i_navigation_service.dart';
import 'package:spallawebapp/presentation/views/web_app/dashboard/components/dashboard_drawer_button_item_data.dart';

class DashboardController {
  final INavigationService _navigationService;
  final ValueNotifier<bool> _drawerVisibility = ValueNotifier<bool>(false);

  DashboardController(this._navigationService);

  ValueNotifier<bool> get drawerVisibility => _drawerVisibility;

  void toggleDrawerVisibility() {
    _drawerVisibility.value = !_drawerVisibility.value;
  }

  List<DashboardDrawerButtonItemData> getMenuItems(String module) {
    final permissions = _navigationService.getPermissionsByModule(module);

    if (permissions == null) return [];

    return permissions
        .map((permission) => DashboardDrawerButtonItemData(
              initialLocation: permission.rota ?? AppRoutesNames.homeNamedPage,
              icon: getIconForPermission(permission.permissao ?? ''),
              label: permission.nome,
              permissionKey: permission.permissao ?? '',
            ))
        .toList();
  }

  Icon getIconForPermission(String permission) {
    switch (permission) {
      case 'home':
        return const Icon(Icons.home);
      case 'profile':
        return const Icon(Icons.person);
      case 'settings':
        return const Icon(Icons.settings);
      case 'CadastrodeClientes1':
        return const Icon(Icons.people_alt);
      case 'SpacomPedidoCliente1':
        return const Icon(Icons.shopping_cart);
      default:
        return const Icon(Icons.menu);
    }
  }
}
