import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/test_assets_extention/assets.dart';
import '../views/home_view.dart';
import 'nav_circle.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76.h,
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => onChanged(0),
            child: Container(
              height: 56.w,
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              decoration: BoxDecoration(
                gradient: selectedIndex != 0
                    ? LinearGradient(
                        begin: AlignmentGeometry.centerLeft,
                        end: AlignmentGeometry.centerRight,
                        colors: [Color(0xff1F1F1F), Color(0xff333333)],
                      )
                    : null,
                color: selectedIndex == 0 ? HomeColors.red : HomeColors.circle,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(MyAssets.assetsImagesHomeMovie),
                  if (selectedIndex == 0) ...[
                    SizedBox(width: 8.w),
                    Text(
                      'Movies',
                      style: TextStyle(
                        color: HomeColors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          NavCircle(
            icon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
              child: SvgPicture.asset(MyAssets.assetsImagesVideoPlayer),
            ),
            selected: selectedIndex == 1,
            onTap: () => onChanged(1),
          ),
          NavCircle(
            icon: Padding(
              padding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 12.w),
              child: SvgPicture.asset(MyAssets.assetsImagesCard),
            ),
            selected: selectedIndex == 2,
            onTap: () => onChanged(2),
          ),
          Icon(Icons.more_horiz, color: Colors.white),
        ],
      ),
    );
  }
}
