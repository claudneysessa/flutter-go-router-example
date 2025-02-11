import 'package:flutter/material.dart';
import 'package:spallawebapp/common/components/standard_view.dart';
import 'package:spallawebapp/presentation/views/spacad/cadastro_cliente/cadastro_cliente_controller.dart';

class CadastroClienteView extends StatefulWidget {
  final String? id;

  const CadastroClienteView({
    Key? key,
    this.id,
  }) : super(key: key);

  @override
  State<CadastroClienteView> createState() => _CadastroClienteViewState();
}

class _CadastroClienteViewState extends State<CadastroClienteView> {
  final controller = CadastroClienteController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StandardView(
      title: 'Cadastro de Clientes',
      child: ValueListenableBuilder<bool>(
        valueListenable: controller.isLoading,
        builder: (context, isLoading, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text(
                        'Cadastro de Clientes',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ),
              ),
              Offstage(
                offstage: widget.id == null,
                child: Center(
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : Text(
                          'ID: ${widget.id}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                          ),
                        ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
