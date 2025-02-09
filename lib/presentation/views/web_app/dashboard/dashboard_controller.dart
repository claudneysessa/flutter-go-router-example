import 'package:flutter/material.dart';
import 'package:spallawebapp/common/routes/app_router.dart';
import 'package:spallawebapp/presentation/views/web_app/dashboard/components/dashboard_drawer_button_item_data.dart';

class DashboardController {
  ValueNotifier<bool> isDrawerVisible = ValueNotifier<bool>(false);

  setDrawerVisibility() {
    isDrawerVisible.value = !isDrawerVisible.value;
  }

  final dashboardMenuItens = [
    DashboardDrawerButtonItemData(
      initialLocation: AppRoutesNames.homeNamedPage,
      icon: const Icon(Icons.home),
      label: 'Home',
    ),
    DashboardDrawerButtonItemData(
      initialLocation: AppRoutesNames.profileNamedPage,
      icon: const Icon(Icons.person),
      label: 'Profile',
    ),
    DashboardDrawerButtonItemData(
      initialLocation: AppRoutesNames.settingsNamedPage,
      icon: const Icon(Icons.settings),
      label: 'Setting',
    ),
  ];
}
