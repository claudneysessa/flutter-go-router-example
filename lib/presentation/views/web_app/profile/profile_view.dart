import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({
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
          'Profile',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
