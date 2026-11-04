part of 'sign_up_cubit.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}

final class SignUpSuccessState extends SignUpState {}

final class SignUpFailureState extends SignUpState {
  final String errorMessage;

  const SignUpFailureState({required this.errorMessage});
}

final class SignUpLoadingState extends SignUpState {}
