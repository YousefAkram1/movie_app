import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/errors/error_handlig.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  Future<void> signUp({required String email, required String password}) async {
    emit(SignUpLoadingState());
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SignUpSuccessState());
    } catch (e) {
      emit(SignUpFailureState(errorMessage: ErrorHandling.handle(e).message));
    }
  }
}
