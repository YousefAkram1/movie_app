import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/movie_home_details_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<MovieEntity>>> getMovieList();
  Future<Either<Failure, MovieEntity>> getMovieDetailsHome({required int id});
  Future<Either<Failure, List<MovieEntity>>> searchMovie({
    required String movieName,
  });
}
