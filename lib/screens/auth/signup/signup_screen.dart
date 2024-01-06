import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:markt/routes/app_routes.dart';
import 'package:markt/screens/auth/signup/signup_controller.dart';
import 'package:markt/styles/assets.dart';
import 'package:markt/styles/colors.dart';
import 'package:markt/styles/text_styles.dart';
import 'package:markt/widgets/app_bar_widget.dart';
import 'package:markt/widgets/buttons.dart';
import 'package:markt/widgets/text_field.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({Key? key}) : super(key: key);
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GetBuilder<SignUpController>(
      init: SignUpController(),
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
                              title: "Anmeldung",
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
                                "Geben Sie Ihre Anmeldeinformationen ein, um fortzufahren",
                                style: AppTextStyles.regular_16.copyWith(
                                  color: AppColors.darkGreyColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            //Name
                            AppTextField(
                              borderRadius: 0,
                              hint: "Gib deinen Namen ein",
                              label: "Name",
                              editingController: controller.nameCtrl,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Bitte geben Sie Ihren Namen ein";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            //Email
                            AppTextField(
                              borderRadius: 0,
                              hint: "Geben sie ihre E-Mail Adresse ein",
                              label: "Email",
                              editingController: controller.emailCtrl,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Bitte geben Sie ihre E-Mail-Adresse ein";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            //Phome mumber
                            AppTextField(
                              borderRadius: 0,
                              hint: "Trage deine Telefonnummer ein",
                              label: "Telefonnummer",
                              inputType: TextInputType.number,
                              editingController: controller.phoneCtrl,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Bitte gib deine Telefonnummer ein";
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
                              height: 30.h,
                            ),
                            //Confirm password
                            AppTextField(
                              borderRadius: 0,
                              hint: "Bestätigen Sie Ihr Passwort",
                              label: "Passwort Bestätigung",
                              isPassword: true,
                              editingController: controller.cpwdCtrl,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Bitte geben Sie Ihr Bestätigungspasswort ein";
                                } else if (controller.pwdCtrl.text !=
                                    controller.cpwdCtrl.text) {
                                  return "Passwort stimmt nicht überein";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            //Comment
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Indem Sie fortfahren, stimmen Sie unseren Nutzungsbedingungen und Datenschutzbestimmungen zu.",
                                style: AppTextStyles.regular_16.copyWith(
                                  color: AppColors.darkGreyColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            //Button
                            Obx(
                              () {
                                return PrimaryButton(
                                  title: "Anmeldung",
                                  processing: controller.inProgress.value,
                                  onClick: () {
                                    if (formKey.currentState!.validate()) {
                                      controller.signup();
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
                                  "Sie haben bereits ein Konto? ",
                                  style: AppTextStyles.regular_12.copyWith(
                                    color: AppColors.primaryTextColor,
                                  ),
                                ),
                                InkWell(
                                  onTap: () => {
                                    Get.offNamed(AppRoutes.signin),
                                  },
                                  child: Text(
                                    "Einloggen",
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
