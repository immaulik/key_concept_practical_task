import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/const/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    splashFactory: InkRipple.splashFactory,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    highlightColor: Colors.transparent,
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      surface: AppColors.backgroundColor,
      background: AppColors.white,
      onPrimary: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: AppColors.homeContainerBackground,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      iconTheme: const IconThemeData(color: AppColors.black),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18.sp,
        color: AppColors.black,
      ),
    ),
  );

  TextTheme buildTextTheme(TextTheme base) {
    return base.copyWith(
      labelSmall: base.labelSmall?.copyWith(fontSize: 11.0),
      labelMedium: base.labelMedium?.copyWith(fontSize: 12.0),
      labelLarge: base.labelLarge?.copyWith(fontSize: 14.0),
      bodySmall: base.bodySmall?.copyWith(fontSize: 12.0),
      bodyMedium: base.bodyMedium?.copyWith(fontSize: 14.0),
      bodyLarge: base.bodyLarge?.copyWith(fontSize: 16.0),
      titleSmall: base.titleSmall?.copyWith(fontSize: 14.0),
      titleMedium: base.titleMedium?.copyWith(fontSize: 16.0),
      titleLarge: base.titleLarge?.copyWith(fontSize: 22.0),
      headlineSmall: base.headlineSmall?.copyWith(fontSize: 24.0),
      headlineMedium: base.headlineMedium?.copyWith(fontSize: 28.0),
      headlineLarge: base.headlineLarge?.copyWith(fontSize: 32.0),
      displaySmall: base.displaySmall?.copyWith(fontSize: 36.0),
      displayMedium: base.displayMedium?.copyWith(fontSize: 45.0),
      displayLarge: base.displayLarge?.copyWith(fontSize: 57.0),
    );
  }
}
