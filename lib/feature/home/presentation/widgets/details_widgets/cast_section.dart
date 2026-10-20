import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/test_assets_extention/assets.dart';
import '../../views/movie_details.dart';

class CastSection extends StatelessWidget {
  const CastSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Text(
            'Cast',
            style: TextStyle(
              color: DetailsColors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 64.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: 7,
            separatorBuilder: (_, __) => SizedBox(width: 9.w),
            itemBuilder: (context, index) {
              return Container(
                clipBehavior: Clip.antiAlias,
                width: 62.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17.r),
                ),
                child: Image.asset(
                  fit: BoxFit.cover,
                  MyAssets.assetsImagesImage2,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
