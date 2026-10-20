import 'package:flutter/material.dart';
import '../../../../core/utils/values/app_colors.dart';

class DividerAndOr extends StatelessWidget {
  const DividerAndOr({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            endIndent: 8,
            color: AppColors.authContainerColor,
            height: 1,
          ),
        ),
        Text(
          "or",
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 14,
            fontWeight: FontWeight(400),
          ),
        ),
        Expanded(
          child: Divider(
            indent: 8,
            color: AppColors.authContainerColor,
            height: 1,
          ),
        ),
      ],
    );
  }
}
