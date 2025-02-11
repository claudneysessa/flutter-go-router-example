import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spallawebapp/common/navigation/navigation_state.dart';
import 'package:spallawebapp/common/style/app_colors.dart';
import 'package:spallawebapp/presentation/views/web_app/dashboard/components/dashboard_drawer_button_item_data.dart';

class CustomDrawerButton extends StatelessWidget {
  final DashboardDrawerButtonItemData itemData;
  final NavigationState state;
  final String permissionKey;
  final VoidCallback onTap;
  final bool isSelected;

  const CustomDrawerButton({
    Key? key,
    required this.itemData,
    required this.state,
    required this.permissionKey,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4),
      elevation: 2,
      child: InkWell(
        onTap: () {
          context.go(itemData.initialLocation);
          onTap();
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.blue : AppColors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              itemData.icon,
              const SizedBox(height: 4),
              Text(
                itemData.label ?? '',
                style: TextStyle(
                  color: isSelected ? AppColors.white : AppColors.black,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
