import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../cubit/details_cubit/movie_details_cubit.dart';
import '../widgets/details_widgets/cast_section.dart';
import '../widgets/details_widgets/details_header.dart';
import '../widgets/details_widgets/divider.dart';
import '../widgets/details_widgets/first_section_details.dart';
import '../widgets/details_widgets/poster_image.dart';
import '../widgets/details_widgets/second_section.dart';
import '../widgets/details_widgets/story_plot.dart';
import '../widgets/details_widgets/ticket_btn.dart';

class DetailsColors {
  static const panel = Color(0xFF1C1C1C);
  static const circle = Color(0xFF222222);
  static const red = Color(0xFFEE2B3E);
  static const white = Colors.white;
  static const divider = Color(0xFF8A8A8A);
}

class MovieDetailsView extends StatefulWidget {
  const MovieDetailsView({super.key, required this.id});
  final int id;

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  @override
  void initState() {
    BlocProvider.of<MovieDetailsCubit>(context).getMovieDetails(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsSuccess) {
            return Stack(
              children: [
                PosterImage(
                  id: state.movie.id,
                  poster: 'https://image.tmdb.org/t/p/w500${state.movie.image}',
                ),

                SafeArea(
                  child: Column(
                    children: [
                      DetailsHeader(),

                      SizedBox(height: 191.h),

                      Expanded(
                        child: Container(
                          height: 463.h,
                          width: 365.w,
                          margin: EdgeInsets.symmetric(horizontal: 12.w),
                          decoration: BoxDecoration(
                            color: DetailsColors.panel,
                            borderRadius: BorderRadius.circular(48.r),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(48.r),
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              padding: EdgeInsets.fromLTRB(
                                16.w,
                                26.h,
                                20.w,
                                21.h,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DetailsFirstSection(title: state.movie.title),

                                  const CostomDivider(),

                                  DetailsSecondSection(
                                    releaseDate: DateFormat(
                                      'd MMMM yyyy',
                                      'en',
                                    ).format(state.movie.releaseDate!),
                                  ),

                                  const CostomDivider(),

                                  StoryPlotSection(
                                    description: state.movie.description,
                                  ),

                                  const CostomDivider(),

                                  CastSection(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      TecketBtn(),
                    ],
                  ),
                ),
              ],
            );
          } else if (state is MovieDetailsFailure) {
            return Center(child: Text(state.errorMessage));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
