import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:markt/globals.dart';
import 'package:markt/routes/app_routes.dart';
import 'package:markt/screens/category/category_controller.dart';
import 'package:markt/styles/assets.dart';
import 'package:markt/styles/colors.dart';
import 'package:markt/widgets/app_bar_widget.dart';
import 'package:markt/widgets/bottom_app_bar.dart';
import 'package:markt/widgets/category_item.dart';
import 'package:markt/widgets/text_field.dart';

class CategoryScreen extends GetView<CategoryController> {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<CategoryController>(
      init: CategoryController(),
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
                          title: "Kategorien",
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
                          height: 25.h,
                        ),
                        //Categories
                        Expanded(
                          child: MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: categoriesList.isEmpty
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.greenColor,
                                    ),
                                  )
                                : GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1,
                                      crossAxisSpacing: 14.w,
                                      mainAxisSpacing: 14.w,
                                    ),
                                    itemCount: categoriesList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return CategoryItem(
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
                        ),
                        SizedBox(
                          height: 90.h,
                        ),
                      ],
                    ),
                  ),
                ),
                //Bottom app bar
                BottomAppBarWidget(size: size, category: true),
              ],
            ),
          ),
        );
      },
    );
  }
}
