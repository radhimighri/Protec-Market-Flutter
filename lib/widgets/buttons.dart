import 'package:flutter/material.dart';
import 'package:markt/styles/colors.dart';
import 'package:markt/styles/text_styles.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.title,
    required this.onClick,
    this.processing = false,
    this.width,
    this.textColor,
    this.btnActivated = true,
  }) : super(key: key);
  final String title;
  final VoidCallback onClick;
  final bool processing;
  final double? width;
  final Color? textColor;
  final bool btnActivated;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: 56,
      child: Material(
        color: btnActivated
            ? AppColors.greenColor
            : AppColors.darkGreyColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(4),
        child: InkWell(
          borderRadius: BorderRadius.circular(4),
          splashColor: const Color.fromARGB(120, 255, 255, 255),
          onTap: btnActivated ? onClick : () {},
          child: processing == true
              ? const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : Center(
                  child: Text(
                    title,
                    style: AppTextStyles.medium_16
                        .copyWith(color: textColor ?? AppColors.whiteColor),
                  ),
                ),
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
      {Key? key,
      required this.title,
      required this.onClick,
      this.processing = false,
      this.width,
      this.textColor})
      : super(key: key);
  final String title;
  final VoidCallback onClick;
  final bool processing;
  final double? width;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: 56,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(4),
        child: InkWell(
          borderRadius: BorderRadius.circular(4),
          splashColor: const Color.fromARGB(120, 255, 255, 255),
          onTap: onClick,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: AppColors.greenColor,
                width: 1,
              ),
            ),
            child: processing == true
                ? const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : Center(
                    child: Text(
                      title,
                      style: AppTextStyles.medium_16
                          .copyWith(color: textColor ?? AppColors.greenColor),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class TeritaryButton extends StatelessWidget {
  const TeritaryButton(
      {Key? key,
      required this.title,
      required this.onClick,
      this.processing = false,
      this.width,
      this.textColor})
      : super(key: key);
  final String title;
  final VoidCallback onClick;
  final bool processing;
  final double? width;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: 56,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(4),
        child: InkWell(
          borderRadius: BorderRadius.circular(4),
          splashColor: const Color.fromARGB(120, 255, 255, 255),
          onTap: onClick,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: AppColors.whiteColor,
                width: 1,
              ),
            ),
            child: processing == true
                ? const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : Center(
                    child: Text(
                      title,
                      style: AppTextStyles.medium_16
                          .copyWith(color: textColor ?? AppColors.whiteColor),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
