import 'package:flutter/material.dart';
import 'package:spallawebapp/presentation/views/web_app/dashboard/dashboard_controller.dart';
import 'package:spallawebapp/presentation/views/web_app/dashboard/components/dashboard_drawer.dart';

class DashboardConstants {
  static const double drawerWidth = 425.0;
  static const Duration drawerAnimationDuration = Duration(milliseconds: 200);
  static const double drawerBorderWidth = 3.0;
}

class DashboardLayout extends StatelessWidget {
  final bool isDrawerVisible;
  final ValueChanged<bool> onDrawerChanged;
  final Widget currentPageWidget;
  final DashboardController controller;

  const DashboardLayout({
    Key? key,
    required this.isDrawerVisible,
    required this.onDrawerChanged,
    required this.currentPageWidget,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        currentPageWidget,
        AnimatedPositioned(
          duration: DashboardConstants.drawerAnimationDuration,
          left: isDrawerVisible ? 0 : -DashboardConstants.drawerWidth,
          top: 0,
          bottom: 0,
          width: DashboardConstants.drawerWidth,
          child: DashboardDrawer(controller: controller),
        ),
      ],
    );
  }
}
