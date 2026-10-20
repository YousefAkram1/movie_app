import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/values/app_colors.dart';
import '../../../../core/utils/values/app_routes.dart';
import '../widgets/chip_items.dart';
import '../widgets/final_onBoard_item.dart';

class OnBoardingTwo extends StatelessWidget {
  const OnBoardingTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, right: 18).w,
                child: Align(
                  alignment: AlignmentGeometry.topRight,
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight(400),
                      color: AppColors.textColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 164.h),
              ChipsItems(
                chip1: "Action",
                chip2: "Adventure",
                chip3: "Adventure",
                chip4: "Drama",
              ),
              ChipsItems(
                chip1: "Comedy",
                chip2: "Crime",
                chip3: "Documentary",
                chip4: "Sports",
                chip2Color: AppColors.secondary,
              ),
              ChipsItems(
                chip1: "Fantasy",
                chip2: "Horhor",
                chip3: "Music",
                chip4: "Western",
                chip3Color: AppColors.secondary,
              ),
              ChipsItems(
                chip1: "Horhor",
                chip2: "Thriller",
                chip3: "Sci-fi",
                chip1Color: AppColors.secondary,
              ),
              SizedBox(height: 204.h),

              Center(
                child: Text(
                  "Select thr genres you\n      like to watch",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight(500),
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 54.h),
              TextButton(
                style: ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(Size(340.w, 53.h)),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16).r,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.signIn);
                },
                child: Text(
                  "Next",
                  style: TextStyle(
                    fontWeight: FontWeight(600),
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 21.h),
              FinalOnBoardItem(
                firstColor: AppColors.semiBlack,
                secondColor: AppColors.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
