import 'package:flutter/material.dart';

abstract class BaseController {
  final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);

  ValueNotifier<bool> get isLoading => _isLoading;

  void toggleLoading() {
    _isLoading.value = !_isLoading.value;
  }

  void setLoading(bool value) {
    _isLoading.value = value;
  }

  void dispose() {
    _isLoading.dispose();
  }
}
