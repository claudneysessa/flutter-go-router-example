import 'package:flutter/material.dart';
import 'package:spallawebapp/presentation/views/web_app/dashboard/components/dashboard_drawer.dart';
import 'package:spallawebapp/presentation/views/web_app/dashboard/dashboard_controller.dart';

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
          duration: const Duration(
            milliseconds: 200,
          ),
          left: isDrawerVisible ? 0 : -425,
          top: 0,
          bottom: 0,
          width: 425,
          child: DashboardDrawer(
            context: context,
            controller: controller,
          ),
        ),
      ],
    );
  }
}
