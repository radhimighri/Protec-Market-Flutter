import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markt/styles/colors.dart';
import 'package:markt/styles/text_styles.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    Key? key,
    required this.height,
    required this.bannerList,
  }) : super(key: key);
  final double height;
  final List<Map<String, String>> bannerList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Swiper(
        itemCount: bannerList.length,
        pagination: const SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: DotSwiperPaginationBuilder(
            color: AppColors.primaryColor,
            activeColor: AppColors.greenColor,
          ),
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              image: const DecorationImage(
                image: NetworkImage(
                  "https://www.innovexia.com/wp-content/uploads/2014/11/linear-white-green-gradient-1920x1080-c2-90ee90-ffffff-a-180-f-14-300x169.jpg",
                ),
                fit: BoxFit.cover,
                opacity: 0.5,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bannerList[index]["title"]!,
                    style: GoogleFonts.aclonica(
                      fontSize: 20.sp,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Text(
                    bannerList[index]["subtitle"]!,
                    style: AppTextStyles.medium_16.copyWith(
                      color: AppColors.greenColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
