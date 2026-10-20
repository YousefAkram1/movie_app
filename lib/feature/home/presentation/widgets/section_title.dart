import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../views/home_view.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: HomeColors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              Text(
                'See All',
                style: TextStyle(
                  color: HomeColors.red,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 4.w),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: HomeColors.red,
                size: 11.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
