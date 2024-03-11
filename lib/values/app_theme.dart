import 'package:events_all/values/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData getTheme() {
    const themePrimaryColor = AppColors.blueColor;
    final accentBrightness =
        ThemeData.estimateBrightnessForColor(themePrimaryColor);
    return ThemeData(
      primaryColor: themePrimaryColor,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      brightness: Brightness.light,
      indicatorColor: themePrimaryColor,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: themePrimaryColor,
        selectionHandleColor: themePrimaryColor,
        selectionColor: themePrimaryColor.withOpacity(0.5),
      ),
      scaffoldBackgroundColor: AppColors.white70Color,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.whiteColor,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.whiteColor,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.blackFontColor,
          overflow: TextOverflow.ellipsis,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.greyFontColor,
          overflow: TextOverflow.ellipsis,
        ),
        displayLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColors.blackFontColor,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: themePrimaryColor,
        brightness: Brightness.light,
      ).copyWith(background: AppColors.whiteColor),
    );
  }
}
