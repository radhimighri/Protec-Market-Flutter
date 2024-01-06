// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markt/styles/colors.dart';
import 'package:markt/styles/text_styles.dart';

void showMyBottomSheet({context, height, child}) {
  showModalBottomSheet<dynamic>(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    ),
    builder: (builder) {
      return Container(
        height: height,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: child,
      );
    },
  );
}

class BottomSheetItem extends StatelessWidget {
  const BottomSheetItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onPressed,
    this.isIcon = true,
  }) : super(key: key);
  final String title;
  final String subtitle;
  final VoidCallback onPressed;
  final bool isIcon;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: AppTextStyles.medium_16
                      .copyWith(color: AppColors.darkGreyColor),
                ),
                Row(
                  children: [
                    Text(
                      subtitle,
                      style: AppTextStyles.medium_16
                          .copyWith(color: AppColors.primaryTextColor),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    isIcon
                        ? const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColors.primaryColor,
                          )
                        : Container(),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
