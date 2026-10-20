import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/test_assets_extention/assets.dart';
import '../views/home_view.dart';

class TrendingCard extends StatelessWidget {
  const TrendingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: SizedBox(
        height: 320.h,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 55.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(48.r),
                child: Container(
                  color: const Color(0xFFC1121F),
                  child: Image.asset(
                    'assets/images/image-5.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    errorBuilder: (_, __, ___) => Container(
                      color: const Color(0xFFC1121F),
                      alignment: Alignment.center,
                      child: Text(
                        'EVIL\nDEAD',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: HomeColors.white,
                          fontSize: 56.sp,
                          fontWeight: FontWeight.w900,
                          height: 0.95,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Watch trailer pill (sits right above the info panel)
            Positioned(
              right: 14.w,
              bottom: 118.h,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 9.h),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.75),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Watch Trailer',
                      style: TextStyle(
                        color: HomeColors.white,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    SvgPicture.asset(MyAssets.assetsImagesArrowRight),
                  ],
                ),
              ),
            ),

            Positioned(
              left: 12.w,
              right: 12.w,
              bottom: 0,
              child: Container(
                height: 110.h,
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1C1C),
                  borderRadius: BorderRadius.circular(48.r),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'TRENDING',
                              style: TextStyle(
                                color: HomeColors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 3.h),
                            Text(
                              'EVIL DEAD RISE',
                              style: TextStyle(
                                color: HomeColors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'A',
                                  style: TextStyle(
                                    color: HomeColors.red,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  ' . ENGLISH',
                                  style: TextStyle(
                                    color: HomeColors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'HORHOR',
                              style: TextStyle(
                                color: HomeColors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 70.w,
                            height: 40.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF323232),
                                  Color(0xFF767676),
                                  Color(0xff363535),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(22.r),
                            ),
                            child: Text(
                              'Book',
                              style: TextStyle(
                                color: HomeColors.white,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            '2D.3D.4DX',
                            style: TextStyle(
                              color: HomeColors.white,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
