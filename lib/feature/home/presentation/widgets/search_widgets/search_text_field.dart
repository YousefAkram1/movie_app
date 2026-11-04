import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/test_assets_extention/assets.dart';
import '../../cubit/search_cubit/movie_search_cubit.dart';
import '../../views/search_view.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, required TextEditingController controller})
    : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 50.h,
              child: TextField(
                onSubmitted: (value) {
                  context.read<MovieSearchCubit>().getMovieByName(
                    movieName: value,
                  );
                },
                controller: _controller,
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(
                  color: SearchColors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                cursorColor: SearchColors.white,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(36),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(36),
                  ),
                  filled: true,
                  fillColor: SearchColors.field,
                  constraints: BoxConstraints(minHeight: 50.h, maxHeight: 50.h),
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(14.r),
                    child: SvgPicture.asset(MyAssets.assetsImagesSearchInfo),
                  ),
                  isDense: true,
                  hintText: 'Search any movies name here',
                  hintStyle: TextStyle(color: Colors.white54, fontSize: 12.sp),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
