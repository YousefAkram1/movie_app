import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../views/movie_details.dart';

class TecketBtn extends StatelessWidget {
  const TecketBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 36.w, left: 11.w, bottom: 6.h, top: 13.h),
      padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 11.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 62.h,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: DetailsColors.red,
            foregroundColor: DetailsColors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
          child: Text(
            'Book Tickets',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
