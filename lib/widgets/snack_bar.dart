import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:markt/styles/colors.dart';

void showErrorSnackBar({title, message}) {
  Get.snackbar(
    title,
    message,
    backgroundColor: AppColors.orangeColor,
    borderRadius: 1.r,
    snackPosition: SnackPosition.TOP,
    duration: const Duration(milliseconds: 1400),
    snackStyle: SnackStyle.FLOATING,
  );
}

void showSuccessSnackBar({title, message}) {
  Get.snackbar(
    title,
    message,
    backgroundColor: AppColors.greenColor,
    borderRadius: 1.r,
    snackPosition: SnackPosition.TOP,
    duration: const Duration(milliseconds: 1400),
    snackStyle: SnackStyle.FLOATING,
  );
}
