import 'package:flutter/material.dart';

abstract final class AssetsPaths {
  static const String ball = 'assets/ball.png';
  static const String darkBall = 'assets/dark_ball.png';
  static const String stars = 'assets/star.svg';
  static const String smallStars = 'assets/small star.svg';
  static const String darkEllipse = 'assets/dark Ellipse 7.png';
  static const String ellipse = 'assets/Ellipse 7.png';
}

abstract final class AppColors {
  static final darkBgGradient = [
    const Color.fromRGBO(16, 12, 44, 1),
    Colors.black,
  ];

  static final lightBgGradient = [
    Colors.white,
    const Color.fromRGBO(210, 210, 254, 1),
  ];

  static final darkBallBgGradient = [
    Colors.black,
    const Color.fromRGBO(0, 0, 0, 0),
  ];

  static final lightBallBgGradient = [
    Colors.white,
    const Color.fromRGBO(255, 255, 255, 0),
  ];

  static final errorBallBgGradient = [
    const Color.fromRGBO(231, 22, 21, 1),
    const Color.fromRGBO(231, 22, 21, 0),
  ];

  static const darkBallTextColor = Color.fromRGBO(255, 255, 255, 1);

  static const lightBallTextColor = Color.fromRGBO(108, 105, 140, 1);

  static const hintTextColor = Color.fromRGBO(114, 114, 114, 1);
}
