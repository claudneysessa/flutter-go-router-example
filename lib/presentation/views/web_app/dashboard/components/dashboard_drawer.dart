import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spallawebapp/common/navigation/navigation_cubit.dart';
import 'package:spallawebapp/common/navigation/navigation_state.dart';
import 'package:spallawebapp/common/style/app_colors.dart';
import 'package:spallawebapp/presentation/views/web_app/dashboard/dashboard_controller.dart';
import 'package:spallawebapp/presentation/views/web_app/dashboard/components/dashboard_layout.dart';
import 'dashboard_drawer_button.dart';

class DashboardDrawer extends StatefulWidget {
  final DashboardController controller;

  const DashboardDrawer({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  DashboardDrawerState createState() => DashboardDrawerState();
}

class DashboardDrawerState extends State<DashboardDrawer> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      buildWhen: (previous, current) =>
          previous.permissionKey != current.permissionKey,
      builder: (context, state) {
        return Drawer(
          width: DashboardConstants.drawerWidth,
          shadowColor: Colors.black,
          elevation: 25,
          shape: const Border(
            right: BorderSide(
              color: AppColors.greyDivider,
              width: DashboardConstants.drawerBorderWidth,
            ),
          ),
          backgroundColor: AppColors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: widget.controller
                .getMenuItems('SPAAPP')
                .map(
                  (dashboardMenuItem) => CustomDrawerButton(
                    key: ValueKey(dashboardMenuItem.permissionKey),
                    itemData: dashboardMenuItem,
                    state: state,
                    permissionKey: dashboardMenuItem.permissionKey,
                    onTap: () => widget.controller.toggleDrawerVisibility(),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
