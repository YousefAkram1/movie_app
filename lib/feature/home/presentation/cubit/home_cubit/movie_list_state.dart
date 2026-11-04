part of 'movie_list_cubit.dart';

sealed class MovieListState extends Equatable {
  const MovieListState();

  @override
  List<Object> get props => [];
}

final class MovieListInitial extends MovieListState {}

final class LoadingMovieList extends MovieListState {}

final class SuccessMovieList extends MovieListState {
  final List<MovieEntity> movies;

  const SuccessMovieList({required this.movies});
}

final class FailureMovieList extends MovieListState {
  final String errorMessage;

  const FailureMovieList({required this.errorMessage});
}
