import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String _navPermissionKey = 'nav_permission_key';

  Future<String?> getNavPermissionKey() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_navPermissionKey);
  }

  Future<void> setNavPermissionKey(String permissionKey) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_navPermissionKey, permissionKey);
  }
}
