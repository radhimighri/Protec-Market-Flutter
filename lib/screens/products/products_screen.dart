import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:markt/globals.dart';
import 'package:markt/routes/app_routes.dart';
import 'package:markt/screens/products/products_controller.dart';
import 'package:markt/styles/assets.dart';
import 'package:markt/styles/colors.dart';
import 'package:markt/widgets/app_bar_widget.dart';
import 'package:markt/widgets/product_widget.dart';

class ProductsScreen extends GetView<ProductsController> {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<ProductsController>(
      init: ProductsController(),
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
                          title: controller.category!.name!,
                          suffixIcon: Assets.notifications,
                          suffixClicked: () => {},
                          prefixIcon: Assets.arrowBack,
                          prefixClicked: () => {
                            Get.offNamed(AppRoutes.category),
                          },
                        ),
                        Expanded(
                          child: MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: controller.productsPerCategoryList.isEmpty
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.greenColor,
                                    ),
                                  )
                                : GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.75,
                                      crossAxisSpacing: 14.w,
                                      mainAxisSpacing: 14.w,
                                    ),
                                    itemCount: controller
                                        .productsPerCategoryList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ProductWidget(
                                        product: controller
                                            .productsPerCategoryList[index],
                                        onProductTap: () => {
                                          Get.toNamed(AppRoutes.productdetails,
                                              arguments: controller
                                                      .productsPerCategoryList[
                                                  index]),
                                        },
                                        onAddTap: () => {
                                          addToCart(controller
                                              .productsPerCategoryList[index]),
                                          controller.update(),
                                        },
                                      );
                                    },
                                  ),
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
