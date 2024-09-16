import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/usecases/auth_usecases.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUsecase signUpUsecase;
  SignUpCubit(this.signUpUsecase) : super(SignUpInitial());

  signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(SignUpLoading());

    final response = await signUpUsecase
        .call(SignUpParams(email: email, password: password, name: name));

    response.fold(
      (l) => emit(SignUpError(l.errorMessage)),
      (r) => emit(SignUpSuccess()),
    );
  }
}
