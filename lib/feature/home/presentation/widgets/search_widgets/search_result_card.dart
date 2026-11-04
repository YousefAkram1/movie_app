import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/test_assets_extention/assets.dart';
import '../../../domain/entities/movie_home_details_entity.dart';
import '../../views/movie_details.dart';
import '../../views/search_view.dart';

class ResultCard extends StatelessWidget {
  final MovieEntity movie;

  const ResultCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return MovieDetailsView(id: movie.id);
                  },
                ),
              );
            },
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(27.r),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${movie.image}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 8.w,
                  bottom: 8.h,
                  child: Container(
                    width: 30.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(MyAssets.assetsImagesArrowRight),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 7.h),
        Padding(
          padding: EdgeInsets.only(left: 2.w),
          child: Text(
            movie.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: SearchColors.white,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
