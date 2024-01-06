import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:markt/globals.dart';
import 'package:markt/routes/app_routes.dart';
import 'package:markt/screens/profile/profile_controller.dart';
import 'package:markt/styles/assets.dart';
import 'package:markt/styles/colors.dart';
import 'package:markt/styles/text_styles.dart';
import 'package:markt/widgets/app_bar_widget.dart';
import 'package:markt/widgets/bottom_app_bar.dart';
import 'package:markt/widgets/payment_bottom_sheet.dart';
import 'package:markt/widgets/buttons.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<ProfileController>(
      init: ProfileController(),
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
                BottomAppBarWidget(size: size, profile: true),
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
                          title: "Profil",
                          suffixIcon: controller.isConnected
                              ? Assets.logout
                              : Assets.notifications,
                          suffixClicked: () => {
                            if (controller.isConnected)
                              {
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    backgroundColor:
                                        AppColors.greenColor.withOpacity(0.9),
                                    content: SizedBox(
                                      width: size.width,
                                      height: size.height * 0.3,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "Möchten Sie sich wirklich abmelden?",
                                            style: AppTextStyles.medium_20
                                                .copyWith(
                                                    color:
                                                        AppColors.whiteColor),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TeritaryButton(
                                                title: "Ausloggen",
                                                width: 100.w,
                                                onClick: () {
                                                  controller.logout();
                                                },
                                              ),
                                              TeritaryButton(
                                                title: "Absagen",
                                                width: 100.w,
                                                onClick: () {
                                                  Get.back();
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              }
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const Divider(),
                        //Personal info
                        !controller.isConnected
                            ? Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        "Sie sind nicht authentifiziert. Melden Sie sich jetzt an oder erstellen Sie ein Konto.",
                                        style: AppTextStyles.medium_20),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    PrimaryButton(
                                        title: "Einloggen",
                                        onClick: () {
                                          Get.toNamed(AppRoutes.signin);
                                        }),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    SecondaryButton(
                                        title: "Anmeldung",
                                        onClick: () {
                                          Get.toNamed(AppRoutes.signup);
                                        }),
                                  ],
                                ),
                              )
                            : user == null
                                ? const Expanded(
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: AppColors.greenColor,
                                      ),
                                    ),
                                  )
                                : Column(
                                    children: [
                                      //Personal infos
                                      SizedBox(
                                        width: size.width,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              user!.name!,
                                              style: AppTextStyles.medium_20,
                                            ),
                                            Text(
                                              user!.email!,
                                              style: AppTextStyles.regular_16,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      const Divider(),
                                      ProfileMenuWidget(
                                        title: "Meine Details",
                                        icon: Assets.persodetails,
                                        onClick: () => {
                                          Get.toNamed(AppRoutes.persodetails),
                                        },
                                      ),
                                      const Divider(),
                                      ProfileMenuWidget(
                                        title: "Meine Bestellungen",
                                        icon: Assets.orders,
                                        onClick: () => {
                                          Get.toNamed(AppRoutes.orders),
                                        },
                                      ),
                                      const Divider(),
                                      ProfileMenuWidget(
                                        title: "Hilfe",
                                        icon: Assets.help,
                                        onClick: () => {},
                                      ),
                                      const Divider(),
                                      ProfileMenuWidget(
                                        title: "Um",
                                        icon: Assets.about,
                                        onClick: () => {
                                          Get.toNamed(AppRoutes.about),
                                        },
                                      ),
                                    ],
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

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onClick,
  }) : super(key: key);

  final String title;
  final String icon;
  final VoidCallback onClick;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onClick,
        child: SizedBox(
          width: size.width,
          height: 62.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    icon,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(title, style: AppTextStyles.medium_20),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                color: AppColors.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
