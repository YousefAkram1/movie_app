import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/values/app_colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.hint,
    this.suffixIcon,
    required this.controller,
    this.keyboardType,
    this.secure,
  });
  final String hint;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? secure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: secure == null ? false : secure!,
      keyboardType: keyboardType,
      style: TextStyle(color: Colors.white),
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'please Enter $hint';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 15.w, top: 14.w, bottom: 14.w),
        suffixIcon: suffixIcon,

        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight(400),
          color: AppColors.hintTextField,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: AppColors.textFieldColor, width: 1),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: AppColors.textFieldColor, width: 1),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: AppColors.textFieldColor, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
      ),
    );
  }
}
