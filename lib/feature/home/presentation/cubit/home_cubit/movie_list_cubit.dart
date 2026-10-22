import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/movie_home_details_entity.dart';
import '../../../domain/use_cases/get_movie_list.dart';

part 'movie_list_state.dart';

@injectable
class MovieListCubit extends Cubit<MovieListState> {
  MovieListCubit(this.getMovieListUseCase) : super(MovieListInitial());
  GetMovieListUseCase getMovieListUseCase;
  Future<void> getMovieList() async {
    emit(LoadingMovieList());
    final result = await getMovieListUseCase.call();
    result.fold(
      (fail) {
        emit(FailureMovieList(errorMessage: fail.errorMessage));
      },
      (movies) {
        emit(SuccessMovieList(movies: movies));
      },
    );
  }
}
