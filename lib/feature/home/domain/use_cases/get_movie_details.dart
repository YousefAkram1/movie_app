import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/movie_home_details_entity.dart';
import '../repo/home_repo.dart';

class GetMovieDetailsUseCase {
  final HomeRepo homeRepo;

  GetMovieDetailsUseCase(this.homeRepo);

  Future<Either<Failure, MovieEntity>> call(int id) {
    return homeRepo.getMovieDetailsHome(id: id);
  }
}
