import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/test_assets_extention/assets.dart';
import 'circle_btn.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(14.w, 10.h, 14.w, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleButton(
            icon: Padding(
              padding: const EdgeInsets.all(5.0),
              child: SvgPicture.asset(MyAssets.assetsImagesLeftArrow),
            ),
            onTap: () => Navigator.pop(context),
          ),
          CircleButton(
            icon: Icon(Icons.more_vert_sharp, color: Colors.white, size: 33),

            onTap: () {},
          ),
        ],
      ),
    );
  }
}
