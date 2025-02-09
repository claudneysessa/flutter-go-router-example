import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String _navIndexKey = 'nav_index';

  Future<int> getNavIndex() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_navIndexKey) ?? 0;
  }

  Future<void> setNavIndex(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_navIndexKey, index);
  }
}
