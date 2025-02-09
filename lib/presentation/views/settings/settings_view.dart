import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(
    BuildContext context,
  ) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
