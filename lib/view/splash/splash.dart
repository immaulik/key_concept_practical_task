import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:key_concept_practical_task/core/const/app_colors.dart';
import 'package:key_concept_practical_task/view/splash/splash_controller.dart';

class Splash extends StatelessWidget {
  Splash({super.key});

  final controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.linear,
        tween: Tween(begin: 20.0, end: 1.0),
        builder: (context, value, child) {
          return AnimatedOpacity(
            opacity: value == 20 ? 0 : 1,
            duration: const Duration(milliseconds: 800),
            child: AnimatedScale(
              scale: value == 20 ? 0 : 1,
              duration: const Duration(milliseconds: 800),
              child: Center(
                child: Text(
                  "Practical Task",
                  style: TextStyle(
                    fontSize: 52.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.darkFontColor,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
