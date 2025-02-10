import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spallawebapp/common/components/standard_view.dart';
import 'package:spallawebapp/presentation/views/web_app/profile/profile_controller.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final controller = ProfileController();

  @override
  Widget build(BuildContext context) {
    return StandardView(
      title: 'Profile',
      child: ValueListenableBuilder<bool>(
        valueListenable: controller.isLoading,
        builder: (context, isLoading, child) {
          return Center(
            child: isLoading
                ? const CircularProgressIndicator()
                : const Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
