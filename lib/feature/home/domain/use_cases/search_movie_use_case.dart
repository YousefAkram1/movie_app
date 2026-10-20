import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/movie_home_details_entity.dart';
import '../repo/home_repo.dart';

class SearchMovieUseCase {
  final HomeRepo homeRepo;

  SearchMovieUseCase(this.homeRepo);
  Future<Either<Failure, List<MovieEntity>>> call({required String movieName}) {
    return homeRepo.searchMovie(movieName: movieName);
  }
}
