import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:markt/routes/app_routes.dart';
import 'package:markt/screens/auth/signin/signin_controller.dart';
import 'package:markt/styles/assets.dart';
import 'package:markt/styles/colors.dart';
import 'package:markt/styles/text_styles.dart';
import 'package:markt/widgets/app_bar_widget.dart';
import 'package:markt/widgets/buttons.dart';
import 'package:markt/widgets/text_field.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({Key? key}) : super(key: key);

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<SignInController>(
      init: SignInController(),
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
                //Content
                SizedBox(
                  width: size.width,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            //App bar
                            AppBarWidget(
                              size: size,
                              title: "Einloggen",
                              prefixIcon: Assets.arrowBack,
                              prefixClicked: () => {
                                Get.back(),
                              },
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            //Title
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Geben Sie Ihre E-Mail-Adresse und Ihr Passwort ein",
                                style: AppTextStyles.regular_16.copyWith(
                                  color: AppColors.darkGreyColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            //Email
                            AppTextField(
                              borderRadius: 0,
                              hint: "Geben sie ihre E-Mail Adresse ein",
                              label: "Email",
                              editingController: controller.emailCtrl,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your email";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            //Password
                            AppTextField(
                              borderRadius: 0,
                              hint: "Geben Sie Ihr Passwort ein",
                              label: "Passwort",
                              isPassword: true,
                              editingController: controller.pwdCtrl,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Bitte geben Sie Ihr Passwort ein";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            //Comment
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Passwort vergessen?",
                                style: AppTextStyles.regular_16.copyWith(
                                  color: AppColors.primaryTextColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 120.h,
                            ),
                            //Button
                            Obx(
                              () {
                                return PrimaryButton(
                                  title: "Einloggen",
                                  processing: controller.inProgress.value,
                                  onClick: () {
                                    if (formKey.currentState!.validate()) {
                                      controller.signin();
                                    }
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            //Sign in
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Sie haben kein Konto? ",
                                  style: AppTextStyles.regular_12.copyWith(
                                    color: AppColors.primaryTextColor,
                                  ),
                                ),
                                InkWell(
                                  onTap: () => {
                                    Get.offNamed(AppRoutes.signup),
                                  },
                                  child: Text(
                                    "Anmeldung",
                                    style: AppTextStyles.medium_12.copyWith(
                                      color: AppColors.greenColor,
                                    ),
                                  ),
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
