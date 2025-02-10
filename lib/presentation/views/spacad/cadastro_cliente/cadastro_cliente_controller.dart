import 'package:flutter/material.dart';

class CadastroClienteController {
  final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);

  ValueNotifier<bool> get isLoading => _isLoading;

  void toggleLoading() {
    _isLoading.value = !_isLoading.value;
  }

  // Métodos futuros para manipulação de clientes
}
