import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markt/globals.dart';
import 'package:markt/routes/app_routes.dart';
import 'package:markt/widgets/snack_bar.dart';

class SignInController extends GetxController {
  late TextEditingController emailCtrl;
  late TextEditingController pwdCtrl;
  RxBool inProgress = false.obs;
  @override
  void onInit() {
    super.onInit();
    emailCtrl = TextEditingController();
    pwdCtrl = TextEditingController();
  }

  signin() async {
    inProgress.value = true;
    try {
      var email = emailCtrl.text.trim();
      var pwd = pwdCtrl.text;

      await dbService.login(email, pwd);

      if (token != null) {
        Get.offAllNamed(AppRoutes.profile);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      inProgress.value = false;
      emailCtrl.clear();
      pwdCtrl.clear();
    }
  }
}
