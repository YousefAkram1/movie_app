import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/test_assets_extention/assets.dart';
import '../cubit/home_cubit/movie_list_cubit.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/header_widget.dart';
import '../widgets/recommended_list.dart';
import '../widgets/section_title.dart';
import '../widgets/trending_card.dart';

class HomeColors {
  static const background = Color(0xFF111111);
  static const card = Color(0xFF1E1E1E);
  static const circle = Color(0xFF222222);
  static const red = Color(0xFFEE2B3E);
  static const white = Colors.white;
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(bottom: 110.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  const Header(),
                  SizedBox(height: 22.h),
                  const TrendingCard(),
                  SizedBox(height: 26.h),
                  const SectionTitle(title: 'Recommended Movies'),
                  SizedBox(height: 16.h),
                  BlocBuilder<MovieListCubit, MovieListState>(
                    builder: (context, state) {
                      if (state is SuccessMovieList) {
                        return RecommendedList(movies: state.movies);
                      } else if (state is FailureMovieList) {
                        return Center(child: Text(state.errorMessage));
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ],
              ),
            ),

            Positioned(
              right: 26.w,
              bottom: 99.h,
              child: Container(
                width: 51.w,
                height: 51.w,
                decoration: const BoxDecoration(
                  color: HomeColors.red,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(MyAssets.assetsImagesFilterAltLight),
                ),
              ),
            ),

            Positioned(
              left: 14.w,
              right: 14.w,
              bottom: 8.h,
              child: BottomNavBar(
                selectedIndex: _selectedIndex,
                onChanged: (i) => setState(() => _selectedIndex = i),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
