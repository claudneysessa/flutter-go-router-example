import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spallawebapp/common/routes/app_routes_names.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit()
      : super(const NavigationState(
          bottomNavItems: AppRoutesNames.homeNamedPage,
          index: 0,
        ));

  void getNavBarItem(int index) {
    switch (index) {
      case 0:
        emit(const NavigationState(
          bottomNavItems: AppRoutesNames.homeNamedPage,
          index: 0,
        ));
        break;
      case 1:
        emit(const NavigationState(
          bottomNavItems: AppRoutesNames.profileNamedPage,
          index: 1,
        ));
        break;
      case 2:
        emit(const NavigationState(
          bottomNavItems: AppRoutesNames.settingsNamedPage,
          index: 2,
        ));
        break;
    }
  }
}
