part of 'movie_details_cubit.dart';

sealed class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  @override
  List<Object> get props => [];
}

final class MovieDetailsInitial extends MovieDetailsState {}

final class MovieDetailsLoading extends MovieDetailsState {}

final class MovieDetailsSuccess extends MovieDetailsState {
  final MovieEntity movie;

  const MovieDetailsSuccess({required this.movie});
}

final class MovieDetailsFailure extends MovieDetailsState {
  final String errorMessage;

  const MovieDetailsFailure({required this.errorMessage});
}
