import 'package:flutter/material.dart';

class DashboardDrawerButtonItemData {
  final String initialLocation;
  final Widget icon;
  final String? label;

  DashboardDrawerButtonItemData({
    required this.initialLocation,
    required this.icon,
    this.label,
  });
}
