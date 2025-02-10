import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spallawebapp/common/components/standard_app_bar.dart';
import 'package:spallawebapp/common/style/app_colors.dart';

class StandardView extends StatefulWidget {
  final String title;
  final Widget child;
  final Future<bool> Function()? onWillPop;

  const StandardView({
    Key? key,
    required this.title,
    required this.child,
    this.onWillPop,
  }) : super(key: key);

  @override
  State<StandardView> createState() => _StandardViewState();
}

class _StandardViewState extends State<StandardView> {
  Future<bool> _onWillPop() async {
    if (widget.onWillPop != null) {
      return await widget.onWillPop!();
    }

    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Confirmar saída'),
            content: const Text('Deseja realmente sair desta página?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Não'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Sim'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  void initState() {
    super.initState();
    // Intercepta eventos de navegação do navegador
    SystemChannels.platform.setMethodCallHandler((call) async {
      if (call.method == "SystemNavigator.pop") {
        final shouldPop = await _onWillPop();
        if (!shouldPop) {
          return false;
        }
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: StandardAppBar(title: widget.title),
        body: widget.child,
      ),
    );
  }
}
