import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:markt/routes/app_routes.dart';
import 'package:markt/styles/assets.dart';
import 'package:markt/styles/colors.dart';

import '../globals.dart';

class BottomAppBarWidget extends StatelessWidget {
  const BottomAppBarWidget({
    Key? key,
    required this.size,
    this.home,
    this.category,
    this.cart,
    this.profile,
  }) : super(key: key);

  final Size size;
  final bool? home, category, cart, profile;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        width: size.width,
        height: 90.h,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.w),
            topRight: Radius.circular(30.w),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomAppBarItem(
              isClicked: home ?? false,
              icon: Assets.home,
              onClick: () => Get.offAndToNamed(AppRoutes.home),
            ),
            BottomAppBarItem(
              isClicked: category ?? false,
              icon: Assets.category,
              onClick: () => Get.offAndToNamed(AppRoutes.category),
            ),
            BottomAppBarItem(
              isClicked: cart ?? false,
              icon: Assets.cart,
              onClick: () => Get.offAndToNamed(AppRoutes.cart),
            ),
            BottomAppBarItem(
              isClicked: profile ?? false,
              icon: Assets.menu,
              onClick: () => Get.offAndToNamed(AppRoutes.profile),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomAppBarItem extends StatelessWidget {
  const BottomAppBarItem({
    Key? key,
    required this.isClicked,
    required this.icon,
    required this.onClick,
  }) : super(key: key);
  final bool isClicked;
  final String icon;
  final VoidCallback onClick;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(99999.r),
      color: isClicked ? AppColors.greenColor : AppColors.whiteColor,
      child: InkWell(
        onTap: onClick,
        splashColor: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(99999.r),
        child: icon != Assets.cart
            ? Container(
                width: 54.w,
                height: 54.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    icon,
                    color: isClicked
                        ? AppColors.whiteColor
                        : AppColors.primaryColor,
                    width: 24.w,
                    height: 24.w,
                  ),
                ),
              )
            : Stack(
                children: [
                  Container(
                    width: 54.w,
                    height: 54.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        icon,
                        color: isClicked
                            ? AppColors.whiteColor
                            : AppColors.primaryColor,
                        width: 24.w,
                        height: 24.w,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 20.w,
                      height: 20.w,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Center(
                        child: Text(
                          "${cart.length}",
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
