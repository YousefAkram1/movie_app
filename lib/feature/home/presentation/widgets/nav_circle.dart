import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../views/home_view.dart';

class NavCircle extends StatelessWidget {
  final Widget icon;
  final bool selected;
  final VoidCallback onTap;

  const NavCircle({
    super.key,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 58.w,
        height: 58.w,
        decoration: BoxDecoration(
          color: selected ? HomeColors.red : HomeColors.circle,
          shape: BoxShape.circle,
        ),
        child: icon,
      ),
    );
  }
}
