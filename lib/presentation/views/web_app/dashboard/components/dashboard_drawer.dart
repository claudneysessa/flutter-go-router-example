import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spallawebapp/common/navigation/navigation_cubit.dart';
import 'package:spallawebapp/common/navigation/navigation_state.dart';
import 'package:spallawebapp/common/style/app_colors.dart';
import 'package:spallawebapp/presentation/views/web_app/dashboard/components/dashboard_drawer_button_item_data.dart';
import 'package:spallawebapp/presentation/views/web_app/dashboard/dashboard_controller.dart';

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
        context: context,
        menuItens: widget.controller.dashboardMenuItens,
        controller: widget.controller,
      ),
    );
  }
}

Widget buildDrawer({
  required BuildContext context,
  required List<DashboardDrawerButtonItemData> menuItens,
  required DashboardController controller,
}) {
  return ListView(
    padding: EdgeInsets.zero,
    children: [
      buildDrawerButtons(
        context: context,
        menuItens: menuItens,
        controller: controller,
      ),
    ],
  );
}

Widget buildDrawerButtons({
  required BuildContext context,
  required List<DashboardDrawerButtonItemData> menuItens,
  required DashboardController controller,
}) {
  return BlocBuilder<NavigationCubit, NavigationState>(
    buildWhen: (previous, current) {
      return previous.index != current.index;
    },
    builder: (context, state) {
      return Column(
        children: menuItens
            .map(
              (tab) => CustomDrawerButton(
                itemData: tab,
                state: state,
                index: menuItens.indexOf(tab),
                onTap: () {
                  controller.setDrawerVisibility();
                },
              ),
            )
            .toList(),
      );
    },
  );
}
