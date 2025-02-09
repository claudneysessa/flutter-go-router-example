import 'package:flutter/material.dart';

class HomeDetailView extends StatelessWidget {
  const HomeDetailView({
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
        'Home Details',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
