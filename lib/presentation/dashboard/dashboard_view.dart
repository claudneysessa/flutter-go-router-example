import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spallawebapp/common/style/app_colors.dart';

import 'package:spallawebapp/common/navigation/navigation_cubit.dart';
import 'package:spallawebapp/common/widget/named_nav_bar_item_widget.dart';
import 'package:spallawebapp/presentation/dashboard/dashboard_controller.dart';

import '../../common/routes/constants.dart';

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
      body: widget.currentPageWidget,
      appBar: AppBar(
          title: const Text('Home'), backgroundColor: AppColors.blueDark),
      drawer: Drawer(
        width: 425,
        shadowColor: Colors.black,
        elevation: 25,
        shape: const Border(
            right: BorderSide(color: AppColors.greyDivider, width: 3)),
        backgroundColor: AppColors.blackLight,
        child: _buildDrawer(context, controller.itensMenuLista),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context, List<DbmCustomDrawerButton> tabs) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(color: AppColors.blueDark),
          child: Text(
            'Spalla Web App',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        _buildNavigationButtons(context, tabs),
      ],
    );
  }

  Widget _buildNavigationButtons(
      BuildContext context, List<DbmCustomDrawerButton> tabs) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      buildWhen: (previous, current) {
        return previous.index != current.index;
      },
      builder: (context, state) {
        return Column(
          children: tabs
              .map((tab) => SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (state.index != tabs.indexOf(tab)) {
                          context.read<NavigationCubit>().getNavBarItem(
                                tabs.indexOf(tab),
                              );
                          context.go(tab.initialLocation);
                          Navigator.of(context).pop();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.blueDark),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          tab.icon,
                          const SizedBox(width: 16),
                        ],
                      ),
                    ),
                  ))
              .toList(),
        );
      },
    );
  }
}
