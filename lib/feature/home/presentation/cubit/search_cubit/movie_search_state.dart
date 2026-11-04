part of 'movie_search_cubit.dart';

sealed class MovieSearchState extends Equatable {
  const MovieSearchState();

  @override
  List<Object> get props => [];
}

final class MovieSearchInitial extends MovieSearchState {}

final class MovieSearchLoadingState extends MovieSearchState {}

final class MovieSearchSuccessState extends MovieSearchState {
  final List<MovieEntity> movies;
  const MovieSearchSuccessState({required this.movies});
}

final class MovieSearchFailureState extends MovieSearchState {
  final String errorMessage;
  const MovieSearchFailureState({required this.errorMessage});
}
