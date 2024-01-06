import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:markt/styles/colors.dart';
import 'package:markt/styles/text_styles.dart';

class SubHeaderWidget extends StatelessWidget {
  const SubHeaderWidget({
    Key? key,
    required this.title,
    required this.seeAll,
  }) : super(key: key);

  final String title;
  final String seeAll;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.medium_20.copyWith(
            color: AppColors.primaryTextColor,
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => {seeAll != "" ? Get.offAndToNamed(seeAll) : null},
            child: SizedBox(
              width: 70.w,
              height: 25.h,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "alle",
                  style: AppTextStyles.medium_16.copyWith(
                    color: AppColors.greenColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
