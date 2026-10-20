import 'package:dartz/dartz.dart';
import 'package:movie_app/feature/home/data/mapper/movie_mapper.dart';
import '../../../../core/errors/error_handlig.dart';
import '../../../../core/errors/failure.dart';
import '../data_resource/home_remote_data_source.dart';
import '../../domain/entities/movie_home_details_entity.dart';
import '../../domain/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, MovieEntity>> getMovieDetailsHome({
    required int id,
  }) async {
    try {
      final result = await homeRemoteDataSource.getMovieDetailsData(id: id);

      final movie = MovieMapper.toEntity(result);
      return Right(movie);
    } catch (e) {
      return Left(ServerFailure(errorMessage: ErrorHandling.handle(e).message));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getMovieList() async {
    try {
      final result = await homeRemoteDataSource.getMovieListData();
      final movies = result.map(MovieMapper.toEntity).toList();
      return Right(movies);
    } catch (e) {
      return Left(ServerFailure(errorMessage: ErrorHandling.handle(e).message));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> searchMovie({
    required String movieName,
  }) async {
    try {
      final result = await homeRemoteDataSource.searchMovieData(
        query: movieName,
      );

      final movies = result.map(MovieMapper.toEntity).toList();
      return Right(movies);
    } catch (e) {
      return Left(ServerFailure(errorMessage: ErrorHandling.handle(e).message));
    }
  }
}
