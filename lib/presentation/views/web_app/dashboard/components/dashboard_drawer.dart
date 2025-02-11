import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spallawebapp/common/constants/application_menu_itens.dart';
import 'package:spallawebapp/common/navigation/navigation_cubit.dart';
import 'package:spallawebapp/common/navigation/navigation_state.dart';
import 'package:spallawebapp/common/style/app_colors.dart';
import 'package:spallawebapp/presentation/views/web_app/dashboard/dashboard_controller.dart';
import 'package:spallawebapp/presentation/views/web_app/dashboard/components/dashboard_layout.dart';
import 'package:spallawebapp/presentation/views/web_app/dashboard/components/dashboard_drawer_button_item_data.dart';
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
          shadowColor: Colors.white,
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
            children: _buildModuleMenus(state),
          ),
        );
      },
    );
  }

  List<Widget> _buildModuleMenus(NavigationState state) {
    List<Widget> menuItems = [];

    for (var modulo in ApplicationMenuItem.listaMenu) {
      // Adiciona o título do módulo
      menuItems.add(
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          color: AppColors.greyLight,
          child: Text(
            modulo.nome ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.greyDark,
            ),
          ),
        ),
      );

      // Adiciona os itens do módulo em um grid
      if (modulo.permissoes != null && modulo.permissoes!.isNotEmpty) {
        menuItems.add(
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 2.5,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            padding: const EdgeInsets.all(8),
            children: modulo.permissoes!.map((permissao) {
              return CustomDrawerButton(
                key: ValueKey(permissao.permissao),
                itemData: DashboardDrawerButtonItemData(
                  initialLocation: permissao.rota ?? '',
                  icon: widget.controller
                      .getIconForPermission(permissao.permissao ?? ''),
                  label: permissao.nome,
                  permissionKey: permissao.permissao ?? '',
                ),
                state: state,
                permissionKey: permissao.permissao ?? '',
                isSelected: false,
                onTap: () => widget.controller.toggleDrawerVisibility(),
              );
            }).toList(),
          ),
        );
      }

      // Adiciona um divisor entre módulos
      menuItems.add(const Divider(height: 1));
    }

    return menuItems;
  }
}
