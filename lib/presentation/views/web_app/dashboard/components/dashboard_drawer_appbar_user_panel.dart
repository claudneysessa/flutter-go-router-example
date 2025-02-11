import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spallawebapp/common/style/app_colors.dart';

class DashboardDrawerAppBarUserPanel extends StatelessWidget {
  final String userName;
  final String userAvatar;
  final VoidCallback onClose;

  const DashboardDrawerAppBarUserPanel({
    Key? key,
    required this.userName,
    required this.userAvatar,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Não faz nada para evitar que o clique se propague para o overlay
      },
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.3),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(userAvatar),
            ),
            const SizedBox(height: 16),
            Text(
              userName,
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Administrador',
              style: GoogleFonts.inter(
                fontSize: 14,
                color: AppColors.greyDark,
              ),
            ),
            const SizedBox(height: 24),
            const Divider(height: 1),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.person_outline, color: AppColors.blue),
              title: const Text('Meu Perfil'),
              dense: true,
              onTap: () {
                // Implementar navegação para perfil
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.settings_outlined, color: AppColors.blue),
              title: const Text('Configurações'),
              dense: true,
              onTap: () {
                // Implementar navegação para configurações
              },
            ),
            const SizedBox(height: 16),
            const Divider(height: 1),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: onClose,
                icon: const Icon(Icons.logout),
                label: const Text('Sair'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
