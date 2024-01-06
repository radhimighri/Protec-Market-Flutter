import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markt/models/product.dart';
import 'package:markt/styles/colors.dart';
import 'package:markt/styles/text_styles.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    Key? key,
    required this.onProductTap,
    required this.onAddTap,
    required this.product,
  }) : super(key: key);
  final VoidCallback onProductTap;
  final VoidCallback onAddTap;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(18.r),
        onTap: onProductTap,
        child: Container(
          width: 170.w,
          height: 250.h,
          padding: EdgeInsets.all(15.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(
              color: AppColors.greyColor,
              width: 1.w,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 170.w,
                height: 100.w,
                child: Image.network(product.picture),
              ),
              Text(
                product.name!.length > 20
                    ? "${product.name!.substring(0, 14)}..."
                    : product.name!,
                style: AppTextStyles.medium_16.copyWith(
                  color: AppColors.primaryTextColor,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "€${product.price!}",
                    style: AppTextStyles.medium_16.copyWith(
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                  //add button
                  Container(
                    width: 35.w,
                    height: 35.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.r),
                      color: AppColors.greenColor,
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(18.r),
                      onTap: onAddTap,
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
