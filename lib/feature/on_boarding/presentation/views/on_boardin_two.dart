import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/values/app_colors.dart';
import '../../../../core/utils/values/app_routes.dart';
import '../widgets/chip_items.dart';
import '../widgets/final_onBoard_item.dart';

class OnBoardingTwo extends StatelessWidget {
  final VoidCallback onFirstTap;
  final VoidCallback onSecondTap;

  const OnBoardingTwo({
    super.key,
    required this.onFirstTap,
    required this.onSecondTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
              SizedBox(height: 164.h),
              ChipsItems(
                chip1: 'Action',
                chip2: 'Adventure',
                chip3: 'Animation',
                chip4: 'Drama',
              ),
              ChipsItems(
                chip1: 'Comedy',
                chip2: 'Crime',
                chip3: 'Documentary',
                chip4: 'Sports',
                chip2Color: AppColors.secondary,
              ),
              ChipsItems(
                chip1: 'Fantasy',
                chip2: 'Horror',
                chip3: 'Music',
                chip4: 'Western',
                chip3Color: AppColors.secondary,
              ),
              ChipsItems(
                chip1: 'Mystery',
                chip2: 'Thriller',
                chip3: 'Sci-fi',
                chip4: 'Romance',
                chip1Color: AppColors.secondary,
              ),
              SizedBox(height: 100.h),
              Center(
                child: Text(
                  'Select the genres you\nlike to watch',
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
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.signIn);
                  },
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
                firstColor: AppColors.semiBlack,
                secondColor: AppColors.secondary,
                onFirstTap: onFirstTap,
                onSecondTap: onSecondTap,
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
