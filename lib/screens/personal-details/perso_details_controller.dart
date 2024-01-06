import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markt/globals.dart';

class PersoDetailsController extends GetxController {
  bool isEnabled = false;
  bool passwordIsVisible = false;
  late TextEditingController nameCtrl;
  late TextEditingController emailCtrl;
  late TextEditingController phoneCtrl;
  late TextEditingController pwdCtrl;

  @override
  void onInit() {
    super.onInit();
    nameCtrl = TextEditingController(text: user!.name!);
    emailCtrl = TextEditingController(text: user!.email!);
    phoneCtrl = TextEditingController(text: user!.phoneNumber!);
    pwdCtrl = TextEditingController(text: "11111111");
  }
}
