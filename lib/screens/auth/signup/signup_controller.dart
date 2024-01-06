import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:markt/globals.dart';
import 'package:markt/routes/app_routes.dart';

class SignUpController extends GetxController {
  late TextEditingController nameCtrl;
  late TextEditingController emailCtrl;
  late TextEditingController phoneCtrl;
  late TextEditingController pwdCtrl;
  late TextEditingController cpwdCtrl;
  RxBool inProgress = false.obs;
  @override
  void onInit() {
    super.onInit();
    nameCtrl = TextEditingController();
    emailCtrl = TextEditingController();
    phoneCtrl = TextEditingController();
    pwdCtrl = TextEditingController();
    cpwdCtrl = TextEditingController();
  }

  signup() async {
    inProgress.value = true;
    try {
      var name = nameCtrl.text.trim();
      var email = emailCtrl.text.trim();
      var pwd = pwdCtrl.text;
      var cpwd = cpwdCtrl.text;
      var phone = phoneCtrl.text;

      await dbService.register(name, email, pwd, cpwd, phone);

      if (token != null) {
        Get.offAllNamed(AppRoutes.profile);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      inProgress.value = false;
      emailCtrl.clear();
      pwdCtrl.clear();
      cpwdCtrl.clear();
      phoneCtrl.clear();
      nameCtrl.clear();
    }
  }
}
