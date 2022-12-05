import 'package:flutter/material.dart';

class AppColors {
  static const Color scrim = Colors.black26;

  static const Color dashboardBlack = Color(0xFF1D1D1D);

  static const Color backgroundColor = Color(0xFF454444);

  static const Color whiteColor = Color(0xFFFFFFFF);

  static const Color dashboardOrange = Color(0xBFFF7500);

  static const Color red = Color(0xFFDA100B);

  static const Color darkScaffoldBg = Color(0xFF121212);
  static const Color lightScaffoldBg = Color(0xFFF7F7FC);

  static const Color label = Color(0xFF6E7191);
  static const Color outline = Color(0xFFD9DBE9);
  static const Color hint = Color(0xFFA0A3BD);
  static const Color inputBg = Color(0xFFEFF0F6);

  static const Color offWhite = Color(0xFFFCFCFC);

  static const Color buttonText = Color(0xFF4E4B66);

  static const Color otpButton = Color(0xFF888888);

  static const Color cardColor = Color(0xFFC0DB1E);
  static const Color errorColor = Color(0xFFE74C3C);
  static const Color successColor = Color(0xFFC0DB1E);

  static const Color darkOffset = Color(0xFF2B2B2E);
  static const Color lightOffset = Color(0xFFF2F4F7);

  static const Color darkColor = Color(0xFF121212);

  static const Color secondary = Color(0xFFF4C893);

  static const int _primaryValue = 0xFF5D3FD3;

  static const MaterialColor primary = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: Color(0xFFfff7f1),
      100: Color(0xFFD4CEEC),
      200: Color(0xFFAFA1E4),
      300: Color(0xFF927FDE),
      400: Color(0xFF785AEC),
      500: Color(_primaryValue),
      600: Color(0xFF3F2D86),
      700: Color(0xFF29204C),
      800: Color(0xFF211B39),
      900: Color(0xFF16141C),
    },
  );
}
