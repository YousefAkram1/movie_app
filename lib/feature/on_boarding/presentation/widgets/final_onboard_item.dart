import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinalOnBoardItem extends StatelessWidget {
  final Color firstColor;
  final Color secondColor;
  final VoidCallback onFirstTap;
  final VoidCallback onSecondTap;

  const FinalOnBoardItem({
    super.key,
    required this.firstColor,
    required this.secondColor,
    required this.onFirstTap,
    required this.onSecondTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onFirstTap,
          child: Container(
            width: 25.w,
            height: 8.h,
            decoration: BoxDecoration(
              color: firstColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
        SizedBox(width: 8.w),
        GestureDetector(
          onTap: onSecondTap,
          child: Container(
            width: 25.w,
            height: 8.h,
            decoration: BoxDecoration(
              color: secondColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
      ],
    );
  }
}
