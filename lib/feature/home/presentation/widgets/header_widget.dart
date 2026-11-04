import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../../core/utils/values/app_routes.dart';
import '../../../../core/utils/test_assets_extention/assets.dart';
import '../views/home_view.dart';
import '../views/search_view.dart';
import 'circle_icon_btn.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hey, Sarthak',
                  style: TextStyle(
                    color: HomeColors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Text(
                      'Karangamal',
                      style: TextStyle(
                        color: HomeColors.red,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: HomeColors.red,
                      size: 11.sp,
                    ),
                  ],
                ),
              ],
            ),
          ),
          CircleIconButton(
            icon: SvgPicture.asset(MyAssets.assetsImagesSearchLight),
            size: 50.w,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchResultsView();
                  },
                ),
              );
            },
          ),
          SizedBox(width: 14.w),
          CircleIconButton(
            icon: SvgPicture.asset(MyAssets.assetsImagesUserLight),
            size: 50.w,
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, AppRoutes.signIn);
              showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.success(message: "Sign out"),
              );
            },
          ),
        ],
      ),
    );
  }
}
