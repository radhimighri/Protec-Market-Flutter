import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:markt/screens/product-details/product_details_controller.dart';
import 'package:markt/styles/assets.dart';
import 'package:markt/styles/colors.dart';
import 'package:markt/styles/text_styles.dart';
import 'package:markt/widgets/app_bar_widget.dart';
import 'package:markt/widgets/buttons.dart';

class ProductDetailsScreen extends GetView<ProductDetailsController> {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<ProductDetailsController>(
      init: ProductDetailsController(),
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
                CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      pinned: true,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      collapsedHeight: 60.h,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Column(
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            //App bar
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: AppBarWidget(
                                size: size,
                                title: "",
                                prefixIcon: Assets.arrowBack,
                                prefixClicked: () => {
                                  Get.back(),
                                },
                                suffixIcon: Assets.notifications,
                                suffixClicked: () => {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverFillRemaining(
                      hasScrollBody: false,
                      fillOverscroll: true,
                      child: SizedBox(
                        width: size.width,
                        child: Column(
                          children: [
                            //Product image
                            SizedBox(
                              width: size.width,
                              height: 280.h,
                              child: Center(
                                child: Image.network(
                                  controller.product!.picture,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            //Details
                            Expanded(
                              child: Container(
                                width: size.width,
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                decoration: BoxDecoration(
                                  color: AppColors.greyColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(35.r),
                                    topRight: Radius.circular(35.r),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    //name
                                    Text(
                                      controller.product!.name!.length > 20
                                          ? "${controller.product!.name!.substring(0, 14)}..."
                                          : controller.product!.name!,
                                      style: AppTextStyles.medium_25.copyWith(
                                          color: AppColors.primaryTextColor),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                      child: const Divider(),
                                    ),
                                    //Description
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Produktdetail",
                                          style: AppTextStyles.medium_20
                                              .copyWith(
                                                  color: AppColors
                                                      .primaryTextColor),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Text(
                                          controller.product!.description!,
                                          style: AppTextStyles.regular_16
                                              .copyWith(
                                                  color: AppColors
                                                      .primaryTextColor),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                      child: const Divider(),
                                    ),
                                    //Price
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Produktpreis",
                                          style: AppTextStyles.medium_20
                                              .copyWith(
                                                  color: AppColors
                                                      .primaryTextColor),
                                        ),
                                        Text(
                                          "€${controller.product!.price!.toStringAsFixed(2)}",
                                          style: AppTextStyles.regular_16
                                              .copyWith(
                                                  color: AppColors
                                                      .primaryTextColor),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                      child: const Divider(),
                                    ),
                                    //product QUANTITY
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Produktmenge",
                                          style: AppTextStyles.medium_20
                                              .copyWith(
                                                  color: AppColors
                                                      .primaryTextColor),
                                        ),
                                        Text(
                                          controller.product!.quantity
                                              .toString(),
                                          style: AppTextStyles.regular_16
                                              .copyWith(
                                                  color: AppColors
                                                      .primaryTextColor),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                      child: const Divider(),
                                    ),
                                    //Product weight
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Produktgewicht",
                                          style: AppTextStyles.medium_20
                                              .copyWith(
                                                  color: AppColors
                                                      .primaryTextColor),
                                        ),
                                        Text(
                                          controller.product!.weight!
                                              .toString(),
                                          style: AppTextStyles.regular_16
                                              .copyWith(
                                                  color: AppColors
                                                      .primaryTextColor),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                      child: const Divider(),
                                    ),
                                    const Expanded(
                                      child: SizedBox(),
                                    ),
                                    //button
                                    PrimaryButton(
                                      title: "Zum Warenkorb hinzufügen",
                                      processing: false,
                                      onClick: () => {
                                        controller.addProductToCart(),
                                      },
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
