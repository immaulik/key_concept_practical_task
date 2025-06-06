import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:key_concept_practical_task/routes/routes.dart' show pages;
import 'package:key_concept_practical_task/routes/routes_name.dart';
import 'package:key_concept_practical_task/theme/app_theme.dart';

import 'core/const/app_string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppString.appName,
          theme: AppTheme.lightTheme,
          themeMode: ThemeMode.light,
          getPages: pages,
          initialRoute: RoutesName.splash,
          builder: (context, child) {
            final mediaQueryData = MediaQuery.of(context);
            final scale = mediaQueryData.textScaler.clamp(
              minScaleFactor: 1.0,
              maxScaleFactor: 1.14,
            );
            return MediaQuery(
              data: mediaQueryData.copyWith(textScaler: scale),
              child: child!,
            );
          },
        );
      },
    );
  }
}
