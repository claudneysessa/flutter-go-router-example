import 'package:spallawebapp/domain/models/application_modulo_permissao_model.dart';

abstract class INavigationService {
  Future<String?> getCurrentPermissionKey();
  Future<void> savePermissionKey(String key);
  String? getRouteByPermission(String permission);
  List<PermissaoModel>? getPermissionsByModule(String module);
}
