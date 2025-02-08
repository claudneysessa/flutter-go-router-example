import 'package:flutter/material.dart';
import 'package:spallawebapp/common/routes/app_routes_names.dart';
import 'package:spallawebapp/common/widget/named_nav_bar_item_widget.dart';

class DashboardController {
  final itensMenuLista = [
    DbmCustomDrawerButton(
      initialLocation: AppRoutesNames.homeNamedPage,
      icon: const Icon(Icons.home),
      label: 'Home',
    ),
    DbmCustomDrawerButton(
      initialLocation: AppRoutesNames.profileNamedPage,
      icon: const Icon(Icons.person),
      label: 'Profile',
    ),
    DbmCustomDrawerButton(
      initialLocation: AppRoutesNames.settingsNamedPage,
      icon: const Icon(Icons.settings),
      label: 'Setting',
    ),
  ];
}
