import 'package:flutter/material.dart';
import 'package:spallawebapp/common/routes/app_router.dart';
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
  late final DashboardController controller;

  @override
  void initState() {
    super.initState();
    controller = DashboardController(AppRouter.navigationService);
  }

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
          controller.toggleDrawerVisibility();
        },
      ),
      body: ValueListenableBuilder<bool>(
        valueListenable: controller.drawerVisibility,
        builder: (context, drawerVisibility, child) {
          return DashboardLayout(
            isDrawerVisible: drawerVisibility,
            onDrawerChanged: (bool visible) {
              controller.toggleDrawerVisibility();
            },
            currentPageWidget: widget.currentPageWidget,
            controller: controller,
          );
        },
      ),
    );
  }
}
