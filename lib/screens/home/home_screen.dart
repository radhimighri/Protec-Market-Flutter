import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:markt/globals.dart';
import 'package:markt/routes/app_routes.dart';
import 'package:markt/screens/home/home_controller.dart';
import 'package:markt/styles/assets.dart';
import 'package:markt/styles/colors.dart';
import 'package:markt/widgets/app_bar_widget.dart';
import 'package:markt/widgets/banner_widget.dart';
import 'package:markt/widgets/bottom_app_bar.dart';
import 'package:markt/widgets/category_item.dart';
import 'package:markt/widgets/product_widget.dart';
import 'package:markt/widgets/subheader_widget.dart';
import 'package:markt/widgets/text_field.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<HomeController>(
      init: HomeController(),
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
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          //App bar
                          AppBarWidget(
                            size: size,
                            title: "PROTECH",
                            suffixIcon: Assets.notifications,
                            suffixClicked: () => {},
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          //Search field
                          AppTextField(
                            borderRadius: 8.r,
                            hint: "Shop durchsuchen",
                            prefixIcon: const Icon(Icons.search),
                            validator: (value) {},
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          //Banner
                          BannerWidget(
                            height: 125.h,
                            bannerList: controller.bannerList,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          //Subheader
                          const SubHeaderWidget(
                            title: "Kategorien",
                            seeAll: AppRoutes.category,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          //Categories
                          SizedBox(
                            width: size.width,
                            height: 165.w,
                            child: categoriesList.isEmpty
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.greenColor,
                                    ),
                                  )
                                : ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                      width: 10.w,
                                    ),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: categoriesList.length ~/ 2,
                                    itemBuilder: (context, index) {
                                      return CategoryItem(
                                        width: 165.w,
                                        height: 165.w,
                                        index: index,
                                        category: categoriesList[index],
                                        onTap: () => {
                                          Get.toNamed(AppRoutes.products,
                                              arguments: categoriesList[index]),
                                        },
                                      );
                                    },
                                  ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          //Subheader
                          const SubHeaderWidget(
                            title: "Produkte",
                            seeAll: AppRoutes.products,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          //Products
                          SizedBox(
                            width: size.width,
                            height: 250.h,
                            child: productsList.isEmpty
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.greenColor,
                                    ),
                                  )
                                : ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                      width: 10.w,
                                    ),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return ProductWidget(
                                        product: productsList[index],
                                        onProductTap: () => {
                                          if (productsList[index].picture !=
                                              null)
                                            {
                                              Get.toNamed(
                                                  AppRoutes.productdetails,
                                                  arguments:
                                                      productsList[index]),
                                            }
                                        },
                                        onAddTap: () => {
                                          addToCart(productsList[index]),
                                          controller.update(),
                                        },
                                      );
                                    },
                                  ),
                          ),
                          SizedBox(
                            height: 100.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //Bottom app bar
                BottomAppBarWidget(size: size, home: true),
              ],
            ),
          ),
        );
      },
    );
  }
}
