import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spallawebapp/common/navigation/navigation_cubit.dart';
import 'package:spallawebapp/common/style/app_colors.dart';
import 'package:spallawebapp/presentation/views/dashboard/dashboard_controller.dart';

import 'dashboard_drawer_button.dart';

class DashboardDrawer extends StatefulWidget {
  final BuildContext context;
  final DashboardController controller;

  const DashboardDrawer({
    Key? key,
    required this.context,
    required this.controller,
  }) : super(key: key);

  @override
  DashboardDrawerState createState() => DashboardDrawerState();
}

class DashboardDrawerState extends State<DashboardDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 425,
      shadowColor: Colors.black,
      elevation: 25,
      shape: const Border(
        right: BorderSide(
          color: AppColors.greyDivider,
          width: 3,
        ),
      ),
      backgroundColor: AppColors.white,
      child: buildDrawer(
        context,
        widget.controller.dashboardMenuItens,
      ),
    );
  }
}

Widget buildDrawer(
  BuildContext context,
  List<DashboardDrawerItemData> tabs,
) {
  return ListView(
    padding: EdgeInsets.zero,
    children: [
      buildNavigationButtons(
        context,
        tabs,
      ),
    ],
  );
}

Widget buildNavigationButtons(
  BuildContext context,
  List<DashboardDrawerItemData> tabs,
) {
  return BlocBuilder<NavigationCubit, NavigationState>(
    buildWhen: (previous, current) {
      return previous.index != current.index;
    },
    builder: (context, state) {
      return Column(
        children: tabs
            .map(
              (tab) => CustomDrawerButton(
                itemData: tab,
                state: state,
                index: tabs.indexOf(tab),
              ),
            )
            .toList(),
      );
    },
  );
}
