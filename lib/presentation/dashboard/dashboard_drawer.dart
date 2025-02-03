import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spallawebapp/common/navigation/navigation_cubit.dart';
import 'package:spallawebapp/common/style/app_colors.dart';
import 'package:spallawebapp/common/widget/named_nav_bar_item_widget.dart';
import 'package:spallawebapp/presentation/dashboard/dashboard_controller.dart';

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
        widget.controller.itensMenuLista,
      ),
    );
  }
}

Widget buildDrawer(
  BuildContext context,
  List<DbmCustomDrawerButton> tabs,
) {
  return ListView(
    padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(
        decoration: BoxDecoration(
          color: AppColors.blueDark,
        ),
        child: Text(
          'Spalla Web App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
      buildNavigationButtons(
        context,
        tabs,
      ),
    ],
  );
}

Widget buildNavigationButtons(
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
                  child: InkWell(
                    onTap: () {
                      if (state.index != tabs.indexOf(tab)) {
                        context.read<NavigationCubit>().getNavBarItem(
                              tabs.indexOf(tab),
                            );
                        context.go(tab.initialLocation);
                        Navigator.of(context).pop();
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: state.index == tabs.indexOf(tab)
                            ? AppColors.white
                            : AppColors.white,
                        border: const Border(
                          bottom: BorderSide(
                            color: AppColors.greyDivider,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          tab.icon,
                          const SizedBox(width: 16),
                        ],
                      ),
                    ),
                  ),
                ))
            .toList(),
      );
    },
  );
}
