import 'package:bloc/bloc.dart';
import 'package:fruitesapp/features/auth/domain/entities/user_entity.dart';
import 'package:fruitesapp/features/auth/domain/usecases/login_with_emailpassword_usecase.dart';
import 'package:meta/meta.dart';

part 'login_emailpassword_state.dart';

class LoginEmailpasswordCubit extends Cubit<LoginEmailpasswordState> {
  LoginEmailpasswordCubit(this.loginWithEmailpasswordUsecase)
      : super(LoginEmailpasswordInitial());
  final LoginWithEmailpasswordUsecase loginWithEmailpasswordUsecase;

  Future<void> loginWithEmailAndPassword(
      {required UserEntity userEntity}) async {
    emit(LoginEmailpasswordLoading());
    var results =
        await loginWithEmailpasswordUsecase.call(userEntity: userEntity);
    results.fold((ifLeft) {
      emit(LoginEmailpasswordFailure(errorMessage: ifLeft.errorMessage));
    }, (ifRight) {
      emit(LoginEmailpasswordSuccess());
    });
  }
}
