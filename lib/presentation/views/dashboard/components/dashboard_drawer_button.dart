import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spallawebapp/common/navigation/navigation_cubit.dart';
import 'package:spallawebapp/common/style/app_colors.dart';

// Importe a classe DbmCustomDrawerButton

class DashboardDrawerItemData {
  final String initialLocation;
  final Widget icon;
  final String? label;

  DashboardDrawerItemData({
    required this.initialLocation,
    required this.icon,
    this.label,
  });
}

class CustomDrawerButton extends StatelessWidget {
  final DashboardDrawerItemData itemData;
  final NavigationState state;
  final int index;

  const CustomDrawerButton({
    Key? key,
    required this.itemData,
    required this.state,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: () {
          if (state.index != index) {
            context.read<NavigationCubit>().getNavBarItem(index);
            context.go(itemData.initialLocation);
            Navigator.of(context).pop();
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
              vertical: 16), // Adiciona padding vertical
          decoration: BoxDecoration(
            color: state.index == index
                ? AppColors.blue // Cor quando selecionado
                : AppColors.white, // Cor padrão
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
                itemData.label ?? '', // Exibe o texto do botão
                style: TextStyle(
                  color: state.index == index
                      ? AppColors.white // Cor do texto quando selecionado
                      : AppColors.black, // Cor do texto padrão
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
