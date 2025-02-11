import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spallawebapp/common/components/standard_view.dart';
import 'package:spallawebapp/presentation/views/web_app/home/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = HomeController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StandardView(
      title: 'Home',
      child: ValueListenableBuilder<bool>(
        valueListenable: controller.isLoading,
        builder: (context, isLoading, child) {
          return Stack(
            children: [
              // Background com logo
              Center(
                child: Opacity(
                  opacity: 0.1, // 10% de opacidade
                  child: Image.asset(
                    'assets/images/spalla_logo.png',
                    width: 300, // Tamanho grande para o background
                    height: 300,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              // Conteúdo centralizado
              Center(
                child: isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                        'Home',
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
