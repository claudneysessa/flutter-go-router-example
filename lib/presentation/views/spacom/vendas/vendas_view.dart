import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spallawebapp/presentation/views/spacom/vendas/vendas_controller.dart';

class VendasView extends StatefulWidget {
  const VendasView({Key? key}) : super(key: key);

  @override
  State<VendasView> createState() => _VendasViewState();
}

class _VendasViewState extends State<VendasView> {
  final controller = VendasController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ValueListenableBuilder<bool>(
        valueListenable: controller.isLoading,
        builder: (context, isLoading, child) {
          return Center(
            child: isLoading
                ? const CircularProgressIndicator()
                : Text(
                    'Vendas',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
