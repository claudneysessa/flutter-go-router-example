import 'package:flutter/material.dart';
import 'package:spallawebapp/common/style/app_colors.dart';
import 'package:spallawebapp/presentation/dashboard/dashboard_controller.dart';
import 'package:spallawebapp/presentation/dashboard/dashboard_drawer.dart';

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
        title: const Text('Dashboard'),
        backgroundColor: AppColors.blue,
      ),
      drawer: DashboardDrawer(
        context: context,
        controller: controller,
      ),
    );
  }
}
