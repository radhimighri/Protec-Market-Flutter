import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:markt/screens/about/about_controller.dart';
import 'package:markt/styles/assets.dart';
import 'package:markt/styles/text_styles.dart';
import 'package:markt/widgets/app_bar_widget.dart';
import 'package:markt/widgets/bottom_app_bar.dart';
import 'package:markt/widgets/buttons.dart';

class AboutScreen extends GetView<AboutController> {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<AboutController>(
      init: AboutController(),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        //App bar
                        AppBarWidget(
                          size: size,
                          title: "Über uns",
                          prefixIcon: Assets.arrowBack,
                          prefixClicked: () => {
                            Get.back(),
                          },
                        ),
                        SizedBox(
                          height: 100.h,
                        ),
                        Text(
                          "Protech ist eine M-Commerce-App,",
                          style: AppTextStyles.medium_16,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "• Erleichtert den täglichen Lebensmitteleinkauf.",
                          style: AppTextStyles.medium_16,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          "• Hilft Ihnen, sich auf einfache und schöne Weise mit Ihrem Lieblingslebensmittelgeschäft zu verbinden.",
                          style: AppTextStyles.medium_16,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          "• Holen Sie sich die besten Angebote von Ihrem Lieblings-Lebensmittelgeschäft.",
                          style: AppTextStyles.medium_16,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          "• Bietet Online-Zahlung mit Paypal und Stripe oder Barzahlung bei Abholung.",
                          style: AppTextStyles.medium_16,
                          textAlign: TextAlign.start,
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        SecondaryButton(
                          title: "Kontaktiere uns",
                          onClick: () => {
                            controller.contactUs(),
                          },
                        ),
                        SizedBox(
                          height: 15.h,
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
