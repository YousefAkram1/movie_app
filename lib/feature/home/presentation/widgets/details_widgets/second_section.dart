import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'info_item.dart';

class DetailsSecondSection extends StatelessWidget {
  const DetailsSecondSection({super.key, required this.releaseDate});
  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoItem(label: 'Censor Rating', value: 'A'),
              InfoItem(label: 'Duration', value: '1hr:38min'),
              InfoItem(label: 'Release date', value: releaseDate),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: const InfoItem(
            label: "Available in language's",
            value: 'English',
          ),
        ),
      ],
    );
  }
}
