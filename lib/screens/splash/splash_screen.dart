import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:markt/screens/splash/splash_controller.dart';
import 'package:markt/styles/assets.dart';
import 'package:markt/styles/colors.dart';
import 'package:markt/styles/text_styles.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<SplashController>(
      init: SplashController(),
      initState: (_) => {},
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                //Background
                Image.asset(
                  Assets.background,
                  width: size.width,
                  height: size.height,
                  fit: BoxFit.cover,
                ),
                //Content
                SizedBox(
                  width: size.width,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 70.h,
                      ),
                      Image.asset(
                        Assets.logo,
                        scale: 0.8,
                      ),
                      SizedBox(
                        height: 150.h,
                      ),
                      Text(
                        'By Protec',
                        style: AppTextStyles.medium_25.copyWith(
                          color: AppColors.primaryTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Image.asset(
                        Assets.proteclogo,
                        width: 150,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
