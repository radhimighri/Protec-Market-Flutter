import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:markt/screens/personal-details/perso_details_controller.dart';
import 'package:markt/styles/assets.dart';
import 'package:markt/widgets/app_bar_widget.dart';
import 'package:markt/widgets/text_field.dart';

class PersoDetailsScreen extends GetView<PersoDetailsController> {
  const PersoDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<PersoDetailsController>(
      init: PersoDetailsController(),
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
                            title: "Meine Details",
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
                            height: 40.h,
                          ),
                          AppTextField(
                            label: "Name",
                            borderRadius: 0.r,
                            isEnabled: controller.isEnabled,
                            editingController: controller.nameCtrl,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Bitte geben Sie Ihren Namen ein";
                              }
                            },
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          AppTextField(
                            label: "Email",
                            borderRadius: 0.r,
                            isEnabled: controller.isEnabled,
                            editingController: controller.emailCtrl,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Bitte geben Sie ihre E-Mail-Adresse ein";
                              }
                            },
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          AppTextField(
                            label: "Telefonnummer",
                            borderRadius: 0.r,
                            isEnabled: controller.isEnabled,
                            editingController: controller.phoneCtrl,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Bitte gib deine Telefonnummer ein";
                              }
                            },
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          AppTextField(
                            label: "Passwort",
                            borderRadius: 0.r,
                            isEnabled: controller.isEnabled,
                            editingController: controller.pwdCtrl,
                            isPassword: !controller.passwordIsVisible,
                            suffixIcon: InkWell(
                              onTap: () {
                                controller.passwordIsVisible =
                                    !controller.passwordIsVisible;
                                controller.update();
                              },
                              child: SizedBox(
                                width: 25.w,
                                height: 25.w,
                                child: Icon(
                                  controller.passwordIsVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Bitte geben Sie Ihr Passwort ein";
                              }
                            },
                          ),
                          SizedBox(
                            height: 100.h,
                          ),
                        ],
                      ),
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
