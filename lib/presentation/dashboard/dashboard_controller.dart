import 'package:flutter/material.dart';
import 'package:spallawebapp/common/routes/constants.dart';
import 'package:spallawebapp/common/widget/named_nav_bar_item_widget.dart';

class DashboardController {
  final itensMenuLista = [
    DbmCustomDrawerButton(
      initialLocation: Routes.homeNamedPage,
      icon: const Icon(Icons.home),
      label: 'Home',
    ),
    DbmCustomDrawerButton(
      initialLocation: Routes.profileNamedPage,
      icon: const Icon(Icons.person),
      label: 'Profile',
    ),
    DbmCustomDrawerButton(
      initialLocation: Routes.settingsNamedPage,
      icon: const Icon(Icons.settings),
      label: 'Setting',
    ),
  ];
}
