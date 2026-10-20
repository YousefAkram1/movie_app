import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../views/movie_details.dart';

class CostomDivider extends StatelessWidget {
  const CostomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      child: Divider(
        height: 1,
        thickness: 1,
        color: DetailsColors.divider.withOpacity(0.8),
      ),
    );
  }
}
