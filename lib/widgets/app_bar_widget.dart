import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markt/styles/colors.dart';
import 'package:markt/styles/text_styles.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
    required this.size,
    required this.title,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixClicked,
    this.prefixClicked,
  }) : super(key: key);

  final Size size;
  final String title;
  final String? suffixIcon;
  final String? prefixIcon;
  final VoidCallback? suffixClicked;
  final VoidCallback? prefixClicked;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              prefixIcon != null
                  ? IconButton(
                      onPressed: prefixClicked,
                      icon: SvgPicture.asset(prefixIcon!),
                    )
                  : Container(),
              prefixIcon != null
                  ? SizedBox(
                      width: 10.w,
                    )
                  : Container(),
              Text(
                title,
                style: AppTextStyles.medium_20.copyWith(
                  color: AppColors.primaryTextColor,
                ),
              ),
            ],
          ),
          suffixIcon != null
              ? IconButton(
                  onPressed: suffixClicked,
                  icon: SvgPicture.asset(suffixIcon!),
                )
              : Container(),
        ],
      ),
    );
  }
}
