import 'package:flutter/cupertino.dart';

class DbmCustomDrawerButton extends BottomNavigationBarItem {
  final String initialLocation;

  DbmCustomDrawerButton({
    required this.initialLocation,
    required Widget icon,
    String? label,
  }) : super(
          icon: icon,
          label: label,
        );
}
