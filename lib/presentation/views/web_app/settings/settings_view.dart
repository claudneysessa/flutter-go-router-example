import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spallawebapp/common/components/standard_view.dart';
import 'package:spallawebapp/presentation/views/web_app/settings/settings_controller.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final controller = SettingsController();

  @override
  Widget build(BuildContext context) {
    return StandardView(
      title: 'Settings',
      child: ValueListenableBuilder<bool>(
        valueListenable: controller.isLoading,
        builder: (context, isLoading, child) {
          return Center(
            child: isLoading
                ? const CircularProgressIndicator()
                : const Text(
                    'Settings',
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
