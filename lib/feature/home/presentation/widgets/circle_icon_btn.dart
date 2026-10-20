import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CircleIconButton extends StatelessWidget {
  final SvgPicture icon;
  final double size;
  final VoidCallback onTap;

  const CircleIconButton({
    super.key,
    required this.icon,
    required this.size,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentGeometry.centerLeft,
            end: AlignmentGeometry.centerRight,
            colors: [Color(0xff1F1F1F), Color(0xff333333)],
          ),

          shape: BoxShape.circle,
        ),
        child: Padding(padding: EdgeInsets.all(9), child: icon),
      ),
    );
  }
}
