import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(
    BuildContext context,
  ) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
