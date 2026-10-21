import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/values/app_colors.dart';

class TextAndTapedTextComponent extends StatelessWidget {
  final String mainText;
  final String pageText;
  final VoidCallback onTap;
  final TextAlign textAlign;

  const TextAndTapedTextComponent({
    super.key,
    required this.mainText,
    required this.pageText,
    required this.onTap,
    required this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        children: [
          TextSpan(
            text: mainText,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.authTextColor,
            ),
          ),
          TextSpan(
            text: pageText,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
