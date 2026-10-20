import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/values/app_colors.dart';
import '../../../../core/utils/values/app_routes.dart';
import '../widgets/final_onBoard_item.dart';
import '../widgets/movie_image_list_view.dart';

class OnBoardingOne extends StatelessWidget {
  const OnBoardingOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
            SizedBox(height: 41.h),
            MovieList(isReverse: false),
            SizedBox(height: 11.h),
            MovieList(isReverse: true),
            SizedBox(height: 98.h),
            Center(
              child: Text(
                "    Tell us about your \nfavorite movie genres",
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
                Navigator.pushNamed(context, AppRoutes.onBoardingTwo);
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
              firstColor: AppColors.secondary,
              secondColor: AppColors.semiBlack,
            ),
          ],
        ),
      ),
    );
  }
}
