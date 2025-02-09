import 'package:flutter/material.dart';
import 'package:spallawebapp/common/routes/app_router.dart';
import 'package:spallawebapp/presentation/views/dashboard/components/dashboard_drawer_button.dart';

class DashboardController {
  final dashboardMenuItens = [
    DashboardDrawerItemData(
      initialLocation: AppRoutesNames.homeNamedPage,
      icon: const Icon(Icons.home),
      label: 'Home',
    ),
    DashboardDrawerItemData(
      initialLocation: AppRoutesNames.profileNamedPage,
      icon: const Icon(Icons.person),
      label: 'Profile',
    ),
    DashboardDrawerItemData(
      initialLocation: AppRoutesNames.settingsNamedPage,
      icon: const Icon(Icons.settings),
      label: 'Setting',
    ),
  ];
}
