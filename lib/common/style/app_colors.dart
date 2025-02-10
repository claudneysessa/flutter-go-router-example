import 'package:flutter/material.dart';

class AppColors {
  static List<Color> backGroundLinearGradient = [
    const Color.fromARGB(255, 16, 54, 110),
    const Color.fromARGB(255, 51, 114, 184),
    const Color.fromRGBO(41, 121, 255, 1),
    AppColors.iceWhite,
  ];
  static List<Color> backGroundHomeLinearGradient = [
    const Color.fromARGB(255, 16, 54, 110),
    const Color.fromARGB(255, 51, 114, 184),
    Colors.blueAccent[400]!,
  ];
  static List<Color> greenBarLinearGradient = [
    const Color.fromARGB(255, 15, 126, 83),
    const Color.fromARGB(255, 0, 255, 157),
  ];
  static List<Color> redBarLinearGradient = [
    const Color.fromARGB(255, 133, 13, 13),
    const Color.fromARGB(255, 255, 80, 80)
  ];

  static const Color blue = Color(0xFF1976D2);
  static const Color blueDark = Color.fromARGB(255, 16, 54, 110);
  static const Color purple = Color.fromARGB(255, 153, 102, 204);
  static const Color green = Color.fromARGB(255, 24, 196, 130);
  static const Color red = Colors.red;
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color iceWhite = Color.fromARGB(255, 237, 240, 245);
  static const Color grey = Color(0xff828b93);
  static const Color greyMidLight = Color(0xffedeff2);
  static const Color greyLight = Color(0xFFF5F5F5);
  static const Color greyText = Color(0xffedeff2);
  static const Color greyDivider = Color(0xFFE0E0E0);
  static const Color greyDark = Color(0xFF757575);
  static const Color blackLight = Color(0xff191e23);

  static const Color greenInfo = Color(0xff14C194);
  static const Color greenBackground = Color(0xffb9ecdf);
  static const Color yellowInfo = Color(0xffE09500);
  static const Color yellowBackground = Color(0xfff8e5c0);
  static const Color blueInfo = Color(0xFF64B5F6);
  static const Color blueBackground = Color(0xFF2196F3);
}
