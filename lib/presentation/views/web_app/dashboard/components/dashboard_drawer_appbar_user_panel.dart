import 'package:flutter/material.dart';
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
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(userAvatar),
            ),
            const SizedBox(height: 8),
            Text(userName),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Executando o callback de fechamento de forma síncrona
                onClose();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blue,
                foregroundColor: Colors.white,
              ),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
