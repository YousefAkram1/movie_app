import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/movie_home_details_entity.dart';
import '../../../domain/use_cases/search_movie_use_case.dart';

part 'movie_search_state.dart';

class MovieSearchCubit extends Cubit<MovieSearchState> {
  MovieSearchCubit(this.searchMovieUseCase) : super(MovieSearchInitial());
  final SearchMovieUseCase searchMovieUseCase;

  Future<void> getMovieByName({required String movieName}) async {
    emit(MovieSearchLoadingState());
    final result = await searchMovieUseCase.call(movieName: movieName);

    result.fold(
      (fail) {
        emit(MovieSearchFailureState(errorMessage: fail.errorMessage));
      },
      (movies) {
        emit(MovieSearchSuccessState(movies: movies));
      },
    );
  }
}
