import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinitus/presentation/utils/colors.dart';
import 'package:infinitus/presentation/utils/constants.dart';
import 'package:infinitus/presentation/utils/styles.dart';

kGetInputBorder(Color color) => OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(16),
      ),
      borderSide: BorderSide(color: color),
    );

ThemeData getLightTheme() {
  final textTheme = GoogleFonts.poppinsTextTheme();

  return ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: AppColors.primary,
      accentColor: AppColors.primary,
      errorColor: AppColors.red,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
    ),
    splashColor: Colors.black.withOpacity(0.2),
    scaffoldBackgroundColor: AppColors.lightScaffoldBg,
    drawerTheme: const DrawerThemeData(scrimColor: AppColors.scrim),
    textTheme: textTheme.copyWith(
      titleLarge: getTitleLargeStyle(color: Colors.black),
      titleMedium: getTitleMediumStyle(color: Colors.black),
      titleSmall: getTitleSmallStyle(color: AppColors.otpButton),
      labelLarge: getBodyLargeStyle(color: AppColors.otpButton),
      labelSmall: getLabelSmallStyle(color: AppColors.label),
      bodyLarge: getBodyLargeStyle(color: AppColors.otpButton),
      bodyMedium: getBodyMediumStyle(color: AppColors.otpButton),
      bodySmall: getBodySmallStyle(color: AppColors.label),
    ),
    toggleableActiveColor: AppColors.primary,
    dialogTheme: DialogTheme(
      shape: kRoundedRectangularBorder(),
    ),
    brightness: Brightness.light,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.primary,
      titleTextStyle: getAppBarTitleStyle(color: AppColors.whiteColor),
    ),
    iconTheme: const IconThemeData(size: 20),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(239, 48),
        elevation: 2,
        textStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.whiteColor,
        shape: kRoundedRectangularBorder(),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        minimumSize: const Size(0, 48),
        textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
            height: kLineHeight(28, fontSize: 16)),
        shape: kRoundedRectangularBorder(),
        //onPrimary: Colors.white,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(0, 48),
        textStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
        ),
        side: const BorderSide(color: AppColors.outline, width: 1),
        shape: kRoundedRectangularBorder(),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      helperMaxLines: 2,
      errorMaxLines: 2,
      isDense: true,
      focusedBorder: kGetInputBorder(AppColors.primary),
      enabledBorder: kGetInputBorder(AppColors.outline),
      errorBorder: kGetInputBorder(AppColors.errorColor),
      focusedErrorBorder: kGetInputBorder(AppColors.red),
      hintStyle: getLabelSmallStyle(
        color: AppColors.hint,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: AppColors.primary.shade100,
      backgroundColor: AppColors.darkOffset,
      elevation: 10,
      surfaceTintColor: Colors.white,
      iconTheme: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return const IconThemeData(size: 20, color: AppColors.primary);
          }
          return const IconThemeData(size: 20, color: AppColors.buttonText);
        },
      ),
      labelTextStyle: MaterialStateProperty.all(
        getBodyMediumStyle(
          color: AppColors.buttonText,
        ),
      ),
    ),
  );
}

ThemeData getDarkTheme() {
  final theme = ThemeData(brightness: Brightness.dark);

  return ThemeData.dark().copyWith(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: AppColors.primary,
      accentColor: AppColors.primary,
      errorColor: AppColors.errorColor,
    ),
    scaffoldBackgroundColor: AppColors.darkScaffoldBg,
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.primary,
      titleTextStyle: getAppBarTitleStyle(color: AppColors.whiteColor),
    ),
    iconTheme: const IconThemeData(size: 20, color: AppColors.whiteColor),
    textTheme: GoogleFonts.poppinsTextTheme(
      theme.textTheme,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(0, 48),
        textStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
        ),
        foregroundColor: AppColors.whiteColor,
        shape: kRoundedRectangularBorder(),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        minimumSize: const Size(0, 48),
        textStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
        ),
        shape: kRoundedRectangularBorder(),
        foregroundColor: AppColors.whiteColor,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(0, 48),
        textStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
        ),
        foregroundColor: AppColors.buttonText,
        shape: kRoundedRectangularBorder(),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      focusedBorder: kGetInputBorder(AppColors.primary),
      enabledBorder: kGetInputBorder(AppColors.outline),
    ),
  );
}
