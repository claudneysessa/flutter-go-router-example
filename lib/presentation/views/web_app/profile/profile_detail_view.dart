import 'package:flutter/material.dart';

class ProfileDetailView extends StatelessWidget {
  const ProfileDetailView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(
    BuildContext context,
  ) {
    return const Center(
      child: Text(
        'Profile Details',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
