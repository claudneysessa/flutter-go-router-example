import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spallawebapp/common/components/standard_view.dart';
import 'package:spallawebapp/presentation/views/web_app/home/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return StandardView(
      title: 'Home',
      child: ValueListenableBuilder<bool>(
        valueListenable: controller.isLoading,
        builder: (context, isLoading, child) {
          return Center(
            child: isLoading
                ? const CircularProgressIndicator()
                : Text(
                    'Home',
                    style: GoogleFonts.inter(
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
