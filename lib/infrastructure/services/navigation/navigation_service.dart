import 'package:spallawebapp/common/constants/application_menu_itens.dart';
import 'package:spallawebapp/domain/interfaces/i_navigation_service.dart';
import 'package:spallawebapp/domain/models/application_modulo_permissao_model.dart';
import 'package:spallawebapp/infrastructure/services/shared_preferences/shared_preferences_service.dart';

class NavigationService implements INavigationService {
  final SharedPreferencesService _preferencesService;

  NavigationService(this._preferencesService);

  @override
  Future<String?> getCurrentPermissionKey() async {
    return await _preferencesService.getNavPermissionKey();
  }

  @override
  Future<void> savePermissionKey(String key) async {
    await _preferencesService.setNavPermissionKey(key);
  }

  @override
  String? getRouteByPermission(String permission) {
    return ApplicationMenuItem.obterRotaPorPermissao(permission);
  }

  @override
  List<PermissaoModel>? getPermissionsByModule(String module) {
    return ApplicationMenuItem.obterPermissoesPorModulo(module);
  }
}
