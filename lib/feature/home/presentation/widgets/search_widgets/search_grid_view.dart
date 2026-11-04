import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../cubit/search_cubit/movie_search_cubit.dart';
import 'search_result_card.dart';

class SearchGridView extends StatelessWidget {
  const SearchGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieSearchCubit, MovieSearchState>(
      builder: (context, state) {
        if (state is MovieSearchSuccessState) {
          return Expanded(
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 19.w),
              itemCount: state.movies.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 9.w,
                mainAxisSpacing: 14.h,
                mainAxisExtent: 190.h,
              ),
              itemBuilder: (context, index) {
                return ResultCard(movie: state.movies[index]);
              },
            ),
          );
        } else if (state is MovieSearchFailureState) {
          return Center(
            child: Text(
              state.errorMessage,
              style: TextStyle(color: Colors.white),
            ),
          );
        } else if (state is MovieSearchLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Center(
            child: Text(
              'You Should Search To Show Movie',
              style: TextStyle(color: Colors.white),
            ),
          );
        }
      },
    );
  }
}
