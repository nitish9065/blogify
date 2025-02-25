import 'package:blogify_flutter/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.backgroundColor,
    fontFamily: "Cera Pro",
    appBarTheme: AppBarTheme(
      // backgroundColor: Pallete.stackBackgroundColor.withOpacity(0.85),
      backgroundColor: AppColor.mainApppurpleColor,
      iconTheme: const IconThemeData(
        color: AppColor.backgroundColor,
      ),
      titleTextStyle: const TextStyle(
        backgroundColor: Colors.transparent,
        fontWeight: FontWeight.w500,
        letterSpacing: 1,
        fontSize: 20,
        color: AppColor.backgroundColor,
      ),
      elevation: 1,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
          statusBarColor: AppColor.mainApppurpleColor),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColor.primary.withValues(alpha: 0.75),
      iconSize: 32.0,
      shape: const CircleBorder(),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shadowColor: AppColor.primary.withValues(alpha: 0.2),
        backgroundColor: AppColor.primary.withValues(alpha: 0.075),
        foregroundColor: AppColor.primary.withValues(alpha: 0.8),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColor.primary,
        side: const BorderSide(
          color: AppColor.primary,
        ),
        iconColor: AppColor.primary,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      alignLabelWithHint: true,
      errorMaxLines: 2,
      fillColor: AppColor.borderColor.withValues(alpha: 0.25),
      prefixIconColor: AppColor.primary.withValues(alpha: 0.75),
      suffixIconColor: AppColor.primary.withValues(alpha: 0.75),
      hintStyle: TextStyle(
        color: AppColor.blackColor.withValues(
          alpha: 0.6,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColor.mainApppurpleColor,
        ),
        borderRadius: BorderRadius.circular(
          12.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColor.mainApppurpleColor,
        ),
        borderRadius: BorderRadius.circular(
          12.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColor.redColor,
        ),
        borderRadius: BorderRadius.circular(
          12.0,
        ),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColor.mainApppurpleColor,
        ),
        borderRadius: BorderRadius.circular(
          12.0,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary.withValues(alpha: 0.8),
        disabledBackgroundColor: AppColor.primary.withValues(alpha: 0.6),
        foregroundColor: AppColor.whiteColor,
        disabledForegroundColor: AppColor.whiteColor,
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 30.0,
        ),
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColor.primary,
    ),
  );
}
