import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:markt/globals.dart';
import 'package:markt/models/order.dart';
import 'package:markt/routes/app_routes.dart';
import 'package:markt/screens/orders/orders_controller.dart';
import 'package:markt/styles/assets.dart';
import 'package:markt/styles/colors.dart';
import 'package:markt/styles/text_styles.dart';
import 'package:markt/widgets/app_bar_widget.dart';
import 'package:markt/widgets/buttons.dart';
import 'package:markt/widgets/cart_product_widget.dart';

class OrdersScreen extends GetView<OrdersController> {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<OrdersController>(
      init: OrdersController(),
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
                          title: "Meine Bestellungen",
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
                        //Products
                        Expanded(
                          child: orders.isEmpty
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Text(
                                      "Sie haben noch keine Bestellungen!",
                                      style: AppTextStyles.medium_20.copyWith(
                                        color: AppColors.primaryTextColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    PrimaryButton(
                                      width: size.width * 0.6,
                                      title: "Entdecken",
                                      onClick: () {
                                        Get.offAndToNamed(
                                          AppRoutes.category,
                                        );
                                      },
                                    ),
                                  ],
                                )
                              : ListView.builder(
                                  itemCount: orders.length,
                                  itemBuilder: (context, index) {
                                    var order = orders[index];
                                    return OrderItemWidget(
                                      order: order,
                                      onClick: () {
                                        Get.toNamed(AppRoutes.orderdetails,
                                            arguments: order);
                                      },
                                    );
                                  },
                                ),
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

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({
    Key? key,
    required this.order,
    required this.onClick,
  }) : super(key: key);

  final Order order;
  final VoidCallback onClick;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  //Icon
                  Container(
                    width: 44.w,
                    height: 44.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.orangeColor,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.shopping_bag,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  //Order details
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Befehl ${order.number!}",
                        style: AppTextStyles.medium_16,
                      ),
                      Text(
                        order.stauts == "pending"
                            ? "ausstehend"
                            : order.stauts!,
                        style: AppTextStyles.regular_16.copyWith(
                          color: order.stauts! == "processing" ||
                                  order.stauts! == "pending"
                              ? AppColors.orangeColor
                              : order.stauts! == "packed"
                                  ? AppColors.redColor
                                  : AppColors.greenColor,
                        ),
                      ),
                      Text(
                        order.pickDate!,
                        style: AppTextStyles.regular_16.copyWith(
                          color: AppColors.primaryTextColor.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              //Price
              Text(
                "€${order.totalPrice!}",
                style: AppTextStyles.medium_16.copyWith(
                  color: AppColors.orangeColor,
                ),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
