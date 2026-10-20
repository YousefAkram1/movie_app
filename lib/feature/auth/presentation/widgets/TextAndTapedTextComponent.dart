import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/values/app_colors.dart';

class TextAndTapedTextComponent extends StatelessWidget {
  final String mainText;
  final String pageText;
  final VoidCallback onTap;
  const TextAndTapedTextComponent({
    super.key,
    required this.mainText,
    required this.pageText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 260.w,
        child: Row(
          children: [
            Text(
              mainText,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight(400),
                color: AppColors.authTextColor,
              ),
            ),
            GestureDetector(
              onTap: onTap,
              child: Text(
                pageText,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight(400),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
