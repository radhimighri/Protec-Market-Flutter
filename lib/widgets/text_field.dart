import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markt/styles/colors.dart';
import 'package:markt/styles/text_styles.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    this.label,
    this.hint,
    this.suffixIcon,
    this.isPassword,
    this.editingController,
    required this.validator,
    this.inputType,
    this.borderRadius,
    this.prefixIcon,
    this.height,
    this.width,
    this.maxLines,
    this.fieldTextStyle,
    this.isEnabled,
  }) : super(key: key);
  final String? label;
  final String? hint;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? isPassword;
  final TextEditingController? editingController;
  final String? Function(String?) validator;
  final TextInputType? inputType;
  final double? borderRadius;
  final double? height;
  final double? width;
  final int? maxLines;
  final TextStyle? fieldTextStyle;
  final bool? isEnabled;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: TextFormField(
        controller: editingController,
        validator: validator,
        enabled: isEnabled ?? true,
        obscureText: isPassword ?? false,
        cursorColor: AppColors.greenColor,
        keyboardType: inputType ?? TextInputType.text,
        style: fieldTextStyle ?? AppTextStyles.medium_16,
        textAlignVertical: TextAlignVertical.center,
        maxLines: maxLines ?? 1,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 11.h),
          fillColor: AppColors.greyColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 99999),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.primaryColor.withOpacity(0.5),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 99999),
            borderSide: const BorderSide(
              width: 1,
              color: AppColors.redColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 99999),
            borderSide: const BorderSide(
              width: 1,
              color: AppColors.primaryColor,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 99999),
            borderSide: const BorderSide(
              width: 1,
              color: AppColors.darkGreyColor,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 99999),
            borderSide: const BorderSide(
              width: 1,
              color: AppColors.primaryColor,
            ),
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelText: label ?? "",
          labelStyle: AppTextStyles.medium_16,
          floatingLabelStyle: AppTextStyles.medium_16.copyWith(
            color: AppColors.primaryColor,
          ),
          hintText: hint ?? "",
          hintStyle: AppTextStyles.regular_16,
        ),
      ),
    );
  }
}
