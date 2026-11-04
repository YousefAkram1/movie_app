import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieImageItem extends StatelessWidget {
  const MovieImageItem({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 133.w,
      height: 182.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3).r),
      child: Image.asset(image, fit: BoxFit.fill),
    );
  }
}
