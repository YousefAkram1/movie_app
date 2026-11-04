import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/values/app_colors.dart';
import '../widgets/final_onBoard_item.dart';
import '../widgets/movie_image_list_view.dart';

class OnBoardingOne extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onFirstTap;
  final VoidCallback onSecondTap;

  const OnBoardingOne({
    super.key,
    required this.onNext,
    required this.onFirstTap,
    required this.onSecondTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5.h, right: 18.w),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 41.h),
            MovieList(isReverse: false),
            SizedBox(height: 11.h),
            MovieList(isReverse: true),
            SizedBox(height: 98.h),
            Center(
              child: Text(
                'Tell us about your\nfavorite movie genres',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 54.h),
            SizedBox(
              width: 340.w,
              height: 53.h,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                onPressed: onNext,
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 21.h),
            FinalOnBoardItem(
              firstColor: AppColors.secondary,
              secondColor: AppColors.semiBlack,
              onFirstTap: onFirstTap,
              onSecondTap: onSecondTap,
            ),
          ],
        ),
      ),
    );
  }
}
