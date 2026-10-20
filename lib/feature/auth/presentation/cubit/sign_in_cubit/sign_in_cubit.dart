import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/errors/error_handlig.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  Future<void> signIn({required String email, required String password}) async {
    emit(SignInLoadingState());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(SignInSuccessState());
    } catch (e) {
      emit(SignInFailureState(errorMessage: ErrorHandling.handle(e).message));
    }
  }
}
