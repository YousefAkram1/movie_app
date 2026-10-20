import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/test_assets_extention/assets.dart';
import '../../../../core/utils/values/app_colors.dart';

class ChipLogoItems extends StatelessWidget {
  const ChipLogoItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 13.w,
      clipBehavior: Clip.antiAlias,
      children: [
        Chip(
          labelPadding: EdgeInsets.only(
            right: 35.w,
            left: 35.w,
            top: 16.h,
            bottom: 15.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16.r),
          ),
          side: BorderSide.none,
          backgroundColor: AppColors.semiBlack,
          label: SvgPicture.asset(
            MyAssets.assetsImagesFacebookIcon,
            width: 20.w,
            height: 20.h,
          ),
        ),
        Chip(
          labelPadding: EdgeInsets.only(
            right: 32.w,
            left: 32.w,
            top: 16.h,
            bottom: 15.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16.r),
          ),
          side: BorderSide.none,
          backgroundColor: AppColors.semiBlack,
          label: SvgPicture.asset(
            MyAssets.assetsImagesGoogleIcon,
            width: 20.w,
            height: 20.h,
          ),
        ),
        Chip(
          labelPadding: EdgeInsets.only(
            right: 32.w,
            left: 32.w,
            top: 16.h,
            bottom: 15.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16.r),
          ),
          side: BorderSide.none,

          backgroundColor: AppColors.semiBlack,
          label: SvgPicture.asset(
            MyAssets.assetsImagesAppleIcon,
            width: 20.w,
            height: 20.h,
          ),
        ),
      ],
    );
  }
}
