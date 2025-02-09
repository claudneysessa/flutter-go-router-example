/* NOVO CÓDIGO */
import 'package:flutter/material.dart';
import 'package:spallawebapp/presentation/views/dashboard/components/dashboard_drawer_appbar.dart';
import 'package:spallawebapp/presentation/views/dashboard/dashboard_controller.dart';
import 'package:spallawebapp/presentation/views/dashboard/components/dashboard_drawer.dart';

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
      extendBodyBehindAppBar: false,
      appBar: const DashboardDrawerAppBar(
        companyName: 'Comercial Paty SP',
        companyLogo:
            'assets/images/spalla_logo.png', // Substitua pelo caminho da sua logo
        userName: 'Antônio Carlos Debone',
        userAvatar:
            'assets/images/user_avatar.png', // Substitua pelo caminho do seu avatar
      ),
      drawer: DashboardDrawer(
        context: context,
        controller: controller,
      ),
    );
  }
}
