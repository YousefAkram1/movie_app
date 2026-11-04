import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/values/app_colors.dart';

class ChipsItems extends StatelessWidget {
  const ChipsItems({
    super.key,
    required this.chip1,
    required this.chip2,
    required this.chip3,
    this.chip4,
    this.chip1Color,
    this.chip2Color,
    this.chip3Color,
    this.chip4Color,
  });

  final String chip1;
  final Color? chip1Color;
  final Color? chip2Color;
  final Color? chip3Color;
  final Color? chip4Color;

  final String chip2;
  final String chip3;
  final String? chip4;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6.w,
      children: [
        Chip(
          elevation: 0,
          side: BorderSide.none,
          backgroundColor: chip1Color ?? AppColors.semiBlack,
          label: Text(
            chip1,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),

        Chip(
          elevation: 0,
          side: BorderSide.none,
          backgroundColor: chip2Color ?? AppColors.semiBlack,
          label: Text(
            chip2,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),

        Chip(
          elevation: 0,
          side: BorderSide.none,
          backgroundColor: chip3Color ?? AppColors.semiBlack,
          label: Text(
            chip3,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),

        if (chip4 != null)
          Chip(
            elevation: 0,
            side: BorderSide.none,
            backgroundColor: chip4Color ?? AppColors.semiBlack,
            label: Text(
              chip4!,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }
}
