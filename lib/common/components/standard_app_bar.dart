import 'package:flutter/material.dart';
import 'package:spallawebapp/common/style/app_colors.dart';

class StandardAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const StandardAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.black,
          fontSize: 24,
        ),
      ),
      centerTitle: true,
      backgroundColor: AppColors.white,
      elevation: 4,
      shadowColor: Colors.black26,
    );
  }
}
