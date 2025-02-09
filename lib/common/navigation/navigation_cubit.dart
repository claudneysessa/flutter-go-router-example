import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spallawebapp/common/navigation/navigation_state.dart';
import 'package:spallawebapp/common/routes/app_router.dart';
import 'package:spallawebapp/infrastructure/services/shared_preferences/shared_preferences_service.dart';

class NavigationCubit extends Cubit<NavigationState> {
  final SharedPreferencesService _navigationCubitService =
      SharedPreferencesService();

  NavigationCubit()
      : super(const NavigationState(
          bottomNavItems: AppRoutesNames.homeNamedPage,
          index: 0,
        )) {
    _loadState();
  }

  Future<void> _loadState() async {
    final index = await _navigationCubitService.getNavIndex();
    getNavBarItem(index);
  }

  Future<void> _saveState(int index) async {
    await _navigationCubitService.setNavIndex(index);
  }

  void getNavBarItem(int index) {
    String routeName;

    switch (index) {
      case 0:
        routeName = AppRoutesNames.homeNamedPage;
        break;
      case 1:
        routeName = AppRoutesNames.profileNamedPage;
        break;
      case 2:
        routeName = AppRoutesNames.settingsNamedPage;
        break;
      default:
        routeName = AppRoutesNames.homeNamedPage;
        index = 0;
        break;
    }

    emit(NavigationState(bottomNavItems: routeName, index: index));
    _saveState(index);
  }
}
