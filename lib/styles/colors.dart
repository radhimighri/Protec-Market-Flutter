import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color greenColor = Color(0xFF5EC401);
  static const Color primaryColor = Color(0xFF37474F);
  static const Color primaryTextColor = Color(0xFF37474F);
  static const Color greyColor = Color(0xFFF2F3F2);
  static const Color darkGreyColor = Color(0xFF7C7C7C);
  static const Color redColor = Color(0xFFD73B77);
  static const Color orangeColor = Color(0xFFF37A20);
  //categories colors
  static const List<Color> categoriesColor = [
    Color(0xFF53B175),
    Color(0xFFF8A44C),
    Color(0xFFF7A593),
    Color(0xFFD3B0E0),
    Color(0xFFFDE598),
    Color(0xFFB7DFF5),
    Color(0xFF836AF6),
    Color(0xFFD73B77),
  ];

  static Color getRandomCategoryColor() {
    Random random = Random();
    int randomNumber = random.nextInt(categoriesColor.length);
    return categoriesColor[randomNumber];
  }
}
