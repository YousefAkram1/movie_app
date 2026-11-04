import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/test_assets_extention/assets.dart';
import '../widgets/details_widgets/circle_btn.dart';
import '../widgets/search_widgets/search_grid_view.dart';
import '../widgets/search_widgets/search_result_text.dart';
import '../widgets/search_widgets/search_text_field.dart';

class SearchColors {
  static const background = Color(0xFF111111);
  static const circle = Color(0xFF1E1E1E);
  static const field = Color(0xFF1A1A1A);
  static const white = Colors.white;
}

class SearchMovie {
  final String title;
  final String image;
  final Color fallback;

  const SearchMovie({
    required this.title,
    required this.image,
    required this.fallback,
  });
}

const List<SearchMovie> searchResults = [
  SearchMovie(
    title: 'AQUAMAN-1',
    image: 'assets/images/image-6.png',
    fallback: Color(0xFF0E5A6B),
  ),
  SearchMovie(
    title: 'AQUAMAN 2',
    image: 'assets/images/image-5.png',
    fallback: Color(0xFF2A8C9C),
  ),
];

class SearchResultsView extends StatefulWidget {
  const SearchResultsView({super.key});

  @override
  State<SearchResultsView> createState() => _SearchResultsViewState();
}

class _SearchResultsViewState extends State<SearchResultsView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  CircleButton(
                    icon: SvgPicture.asset(MyAssets.assetsImagesLeftArrow),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 5.w),
                  SearchTextField(controller: _controller),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            SearchResultText(),

            SizedBox(height: 15.h),
            SearchGridView(),
          ],
        ),
      ),
    );
  }
}
