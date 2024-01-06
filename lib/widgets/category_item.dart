import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markt/models/category.dart';
import 'package:markt/styles/colors.dart';
import 'package:markt/styles/text_styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.index,
    required this.onTap,
    required this.category,
    this.height,
    this.width,
  }) : super(key: key);
  final int index;
  final Category category;
  final double? height;
  final double? width;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var color = AppColors.getRandomCategoryColor();
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? 0.w,
        height: height ?? 0.h,
        decoration: BoxDecoration(
          color: color.withOpacity(0.10),
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(
            color: color.withOpacity(0.25),
            width: 1.w,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 80.w,
              height: 80.w,
              child: Image.network(
                category.logo!,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Text(
                category.name!,
                style: AppTextStyles.medium_16,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
