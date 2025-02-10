import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spallawebapp/common/navigation/navigation_cubit.dart';
import 'package:spallawebapp/common/navigation/navigation_state.dart';
import 'package:spallawebapp/common/style/app_colors.dart';
import 'package:spallawebapp/presentation/views/web_app/dashboard/components/dashboard_drawer_button_item_data.dart';

class CustomDrawerButton extends StatelessWidget {
  final DashboardDrawerButtonItemData itemData;
  final NavigationState state;
  final String permissionKey;
  final VoidCallback onTap;

  const CustomDrawerButton({
    Key? key,
    required this.itemData,
    required this.state,
    required this.permissionKey,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isCurrentRoute =
        state.bottomNavItems == itemData.initialLocation;
    final bool isCurrentPermission = state.permissionKey == permissionKey;

    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: () {
          if (!isCurrentPermission || !isCurrentRoute) {
            context.read<NavigationCubit>().getNavBarItem(permissionKey);

            if (!isCurrentRoute) {
              Future.microtask(() => context.go(itemData.initialLocation));
            }

            onTap();
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: isCurrentPermission ? AppColors.blue : AppColors.white,
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
              itemData.icon,
              const SizedBox(width: 16),
              Text(
                itemData.label ?? '',
                style: TextStyle(
                  color:
                      isCurrentPermission ? AppColors.white : AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
