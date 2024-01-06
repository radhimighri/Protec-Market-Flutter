import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:markt/globals.dart';
import 'package:markt/screens/order-details/order_details_controller.dart';
import 'package:markt/styles/assets.dart';
import 'package:markt/styles/colors.dart';
import 'package:markt/styles/text_styles.dart';
import 'package:markt/widgets/app_bar_widget.dart';
import 'package:markt/widgets/buttons.dart';

class OrderDetailsScreen extends GetView<OrderDetailsController> {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<OrderDetailsController>(
      init: OrderDetailsController(),
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        //App bar
                        AppBarWidget(
                          size: size,
                          title: "Bestelldetails",
                          prefixIcon: Assets.arrowBack,
                          prefixClicked: () => {
                            Get.back(),
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const Divider(),
                        SizedBox(
                          height: 20.h,
                        ),
                        //List of products
                        SizedBox(
                          height: 250.h,
                          width: size.width,
                          child: controller.orderProducts.isEmpty
                              ? Center(
                                  child: Text(
                                    "Keine Produkte in dieser Bestellung.",
                                    style: AppTextStyles.medium_20,
                                  ),
                                )
                              : ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.orderProducts.length,
                                  itemBuilder: (context, index) {
                                    var product =
                                        controller.orderProducts[index];
                                    return Container(
                                      width: size.width * 0.4,
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 5.w,
                                      ),
                                      padding: EdgeInsets.all(5.h),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1.w,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: Image.network(
                                              product.picture ??
                                                  "https://cdn0.iconfinder.com/data/icons/cosmo-layout/40/box-512.png",
                                              height: 140.h,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            product.name!,
                                            style: AppTextStyles.medium_16,
                                          ),
                                          Text(
                                            "€${product.price!}",
                                            style: AppTextStyles.medium_16,
                                          ),
                                          Text(
                                            "Menge: ${product.pivot!.quantity!}",
                                            style: AppTextStyles.medium_16,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const Divider(),
                        SizedBox(
                          height: 10.h,
                        ),
                        //Order
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Bestellnummer",
                              style: AppTextStyles.regular_16,
                            ),
                            Text(
                              controller.order.number!,
                              style: AppTextStyles.medium_16,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        //Total price
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Auftragssumme",
                              style: AppTextStyles.regular_16,
                            ),
                            Text(
                              "${controller.order.totalPrice!} €",
                              style: AppTextStyles.medium_16,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        //Date
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Bestelldatum",
                              style: AppTextStyles.regular_16,
                            ),
                            Text(
                              controller.order.createdAt!,
                              style: AppTextStyles.medium_16,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        //Pick date
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Abholdatum der Bestellung",
                              style: AppTextStyles.regular_16,
                            ),
                            Text(
                              controller.order.pickDate!
                                  .toString()
                                  .substring(0, 10),
                              style: AppTextStyles.medium_16,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),

                        //Payment method
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Zahlungsmethode",
                              style: AppTextStyles.regular_16,
                            ),
                            Text(
                              "${controller.order.paymentMethod}",
                              style: AppTextStyles.medium_16,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const Divider(),
                        SizedBox(
                          height: 10.h,
                        ),
                        //status
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Status",
                              style: AppTextStyles.regular_16,
                            ),
                            Text(
                              controller.order.stauts! == "processing" ||
                                      controller.order.stauts! == "pending"
                                  ? "steht aus"
                                  : controller.order.stauts! == "packed"
                                      ? "verpackt"
                                      : "verpackt",
                              style: AppTextStyles.medium_16.copyWith(
                                color: controller.order.stauts! ==
                                            "processing" ||
                                        controller.order.stauts! == "pending"
                                    ? AppColors.orangeColor
                                    : controller.order.stauts! == "packed"
                                        ? AppColors.redColor
                                        : AppColors.greenColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const Divider(),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        //Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SecondaryButton(
                              title: "Absagen",
                              width: 150.w,
                              onClick: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: AppColors.orangeColor
                                          .withOpacity(0.9),
                                      content: SizedBox(
                                        height: 100.h,
                                        child: Column(
                                          children: [
                                            controller.order.stauts ==
                                                    "Processing"
                                                ? Text(
                                                    "Sie können diese Bestellung leider nicht stornieren, da sie bearbeitet wird.",
                                                    style: AppTextStyles
                                                        .medium_20
                                                        .copyWith(
                                                      color:
                                                          AppColors.whiteColor,
                                                    ),
                                                  )
                                                : controller.order.stauts ==
                                                        "Packed"
                                                    ? Text(
                                                        "Die Bestellung ist verpackt, sie kann nicht storniert werden.",
                                                        style: AppTextStyles
                                                            .medium_20
                                                            .copyWith(
                                                          color: AppColors
                                                              .whiteColor,
                                                        ),
                                                      )
                                                    : Text(
                                                        "Die Bestellung ist kommissioniert! es kann nicht storniert werden.",
                                                        style: AppTextStyles
                                                            .medium_20
                                                            .copyWith(
                                                          color: AppColors
                                                              .whiteColor,
                                                        ),
                                                      ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                            PrimaryButton(
                              title: "Abgeholt",
                              width: 150.w,
                              onClick: () {},
                            ),
                          ],
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
        );
      },
    );
  }
}
