import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/movie_home_details_entity.dart';
import '../../../domain/use_cases/get_movie_details.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit(this.getMovieDetailsUseCase) : super(MovieDetailsInitial());
  final GetMovieDetailsUseCase getMovieDetailsUseCase;

  Future<void> getMovieDetails({required int id}) async {
    emit(MovieDetailsLoading());
    final result = await getMovieDetailsUseCase.call(id);
    result.fold(
      (fail) {
        emit(MovieDetailsFailure(errorMessage: fail.errorMessage));
      },
      (movie) {
        emit(MovieDetailsSuccess(movie: movie));
      },
    );
  }
}
