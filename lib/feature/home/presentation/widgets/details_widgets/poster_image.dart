import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PosterImage extends StatelessWidget {
  const PosterImage({super.key, required this.poster});

  final String poster;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      height: 413.h,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(55).r,
            bottomRight: Radius.circular(55).r,
          ),
        ),
        child: Image.network(poster, fit: BoxFit.cover),
      ),
    );
  }
}
