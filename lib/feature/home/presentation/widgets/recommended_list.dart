import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entities/movie_home_details_entity.dart';
import 'movie_card.dart';

class RecommendedList extends StatelessWidget {
  final List<MovieEntity> movies;
  const RecommendedList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        itemCount: movies.length,
        separatorBuilder: (_, __) => SizedBox(width: 14.w),
        itemBuilder: (context, index) {
          return MovieCard(movie: movies[index]);
        },
      ),
    );
  }
}

class Movie {
  final String title;
  final String image;
  final Color fallback;

  const Movie({
    required this.title,
    required this.image,
    required this.fallback,
  });
}

const List<Movie> recommendedMovies = [
  Movie(
    title: 'SALAAR (PART 1)',
    image: 'assets/images/image-1.png',
    fallback: Color(0xFF2B2B2B),
  ),
  Movie(
    title: 'FLASH (2023)',
    image: 'assets/images/image-2.png',
    fallback: Color(0xFFB3261E),
  ),
  Movie(
    title: 'AQUAMAN',
    image: 'assets/images/image-6.png',
    fallback: Color(0xFF0E5A6B),
  ),
];
