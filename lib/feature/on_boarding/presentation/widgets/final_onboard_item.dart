import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinalOnBoardItem extends StatelessWidget {
  const FinalOnBoardItem({
    super.key,
    required this.firstColor,
    required this.secondColor,
  });
  final Color firstColor;
  final Color secondColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 52.w,
          height: 4,
          decoration: BoxDecoration(
            color: firstColor,
            borderRadius: BorderRadius.circular(3.r),
          ),
        ),
        SizedBox(width: 5.w),
        Container(
          width: 52.w,
          height: 4,
          decoration: BoxDecoration(
            color: secondColor,
            borderRadius: BorderRadius.circular(3.r),
          ),
        ),
      ],
    );
  }
}
