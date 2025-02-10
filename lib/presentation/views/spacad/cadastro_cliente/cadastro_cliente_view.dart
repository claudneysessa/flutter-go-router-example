import 'package:flutter/material.dart';
import 'package:spallawebapp/presentation/views/spacad/cadastro_cliente/cadastro_cliente_controller.dart';

class CadastroClienteView extends StatefulWidget {
  const CadastroClienteView({Key? key}) : super(key: key);

  @override
  State<CadastroClienteView> createState() => _CadastroClienteViewState();
}

class _CadastroClienteViewState extends State<CadastroClienteView> {
  final controller = CadastroClienteController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ValueListenableBuilder<bool>(
        valueListenable: controller.isLoading,
        builder: (context, isLoading, child) {
          return Center(
            child: isLoading
                ? const CircularProgressIndicator()
                : const Text(
                    'Cadastro de Clientes',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
