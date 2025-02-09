import 'package:flutter/material.dart';
import 'package:spallawebapp/presentation/views/web_app/dashboard/components/dashboard_drawer_appbar.dart';
import 'package:spallawebapp/presentation/views/web_app/dashboard/components/dashboard_layout.dart';
import 'package:spallawebapp/presentation/views/web_app/dashboard/dashboard_controller.dart';

class DashboardView extends StatefulWidget {
  final Widget currentPageWidget;

  const DashboardView({
    Key? key,
    required this.currentPageWidget,
  }) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  DashboardController controller = DashboardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: DashboardDrawerAppBar(
        companyName: 'Comercial Paty SP',
        companyLogo: 'assets/images/spalla_logo.png',
        userName: 'Antônio Carlos Debone',
        userAvatar: 'assets/images/user_avatar.png',
        onDrawerMenuTap: () {
          controller.setDrawerVisibility();
        },
      ),
      body: ValueListenableBuilder(
        valueListenable: controller.isDrawerVisible,
        builder: (context, drawerVisibility, child) {
          return DashboardLayout(
            // Use o novo widget
            isDrawerVisible: drawerVisibility,
            onDrawerChanged: (bool visible) {
              controller.setDrawerVisibility();
            },
            currentPageWidget: widget.currentPageWidget,
            controller: controller,
          );
        },
      ),
    );
  }
}
