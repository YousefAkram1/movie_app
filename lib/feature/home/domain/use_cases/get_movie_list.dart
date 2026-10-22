import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failure.dart';
import '../entities/movie_home_details_entity.dart';
import '../repo/home_repo.dart';

@lazySingleton
class GetMovieListUseCase {
  final HomeRepo homeRepo;

  GetMovieListUseCase(this.homeRepo);
  Future<Either<Failure, List<MovieEntity>>> call() {
    return homeRepo.getMovieList();
  }
}
