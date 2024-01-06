import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markt/models/product.dart';
import 'package:markt/styles/colors.dart';
import 'package:markt/styles/text_styles.dart';

class CarProductWidget extends StatelessWidget {
  const CarProductWidget({
    Key? key,
    required this.size,
    required this.product,
    required this.onPlusClicked,
    required this.onMinusClicked,
    required this.onCrossClicked,
  }) : super(key: key);

  final Size size;
  final Product product;
  final VoidCallback onPlusClicked;
  final VoidCallback onMinusClicked;
  final VoidCallback onCrossClicked;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: 140.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Column(
        children: [
          Row(
            children: [
              //Product image
              Image.network(
                product.picture,
                width: 80.w,
                height: 80.w,
              ),
              SizedBox(
                width: 10.w,
              ),
              //Product details
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //Title + Delete button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name!.length > 20
                              ? "${product.name!.substring(0, 14)}..."
                              : product.name!,
                          style: AppTextStyles.medium_16.copyWith(
                            color: AppColors.primaryTextColor,
                          ),
                        ),
                        IconButton(
                          onPressed: onCrossClicked,
                          icon: Icon(
                            Icons.highlight_remove_sharp,
                            color: AppColors.primaryColor,
                            size: 30.w,
                          ),
                        ),
                      ],
                    ),
                    //Price + QUANTITY
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Quantity
                        Row(
                          children: [
                            InkWell(
                              onTap: onMinusClicked,
                              child: Container(
                                width: 40.w,
                                height: 40.w,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.primaryColor,
                                    width: 1.w,
                                  ),
                                  borderRadius: BorderRadius.circular(17.r),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.remove,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 40.w,
                              height: 40.w,
                              child: Center(
                                child: Text(
                                  product.quantity.toString(),
                                  style: AppTextStyles.medium_16.copyWith(
                                      color: AppColors.primaryTextColor),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: onPlusClicked,
                              child: Container(
                                width: 40.w,
                                height: 40.w,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.primaryColor,
                                    width: 1.w,
                                  ),
                                  borderRadius: BorderRadius.circular(17.r),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.add,
                                    color: AppColors.greenColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        //Price
                        Text(
                          "€${product.price!.toStringAsFixed(2)}",
                          style: AppTextStyles.medium_16.copyWith(
                            color: AppColors.primaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
