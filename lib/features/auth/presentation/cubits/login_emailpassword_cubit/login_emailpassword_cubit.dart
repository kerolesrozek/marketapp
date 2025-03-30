import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruitesapp/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:fruitesapp/features/auth/data/repos_imple/auth_repos_imple.dart';
import 'package:fruitesapp/features/auth/domain/entities/user_entity.dart';
import 'package:fruitesapp/features/auth/domain/usecases/login_with_emailpassword_usecase.dart';
import 'package:fruitesapp/features/auth/domain/usecases/login_with_google.dart';
import 'package:meta/meta.dart';

part 'login_emailpassword_state.dart';

class LoginEmailpasswordCubit extends Cubit<LoginEmailpasswordState> {
  LoginEmailpasswordCubit(this.loginWithEmailpasswordUsecase)
      : super(LoginEmailpasswordInitial());
  final LoginWithEmailpasswordUsecase loginWithEmailpasswordUsecase;
  LoginWithGoogle loginWithGoogle = LoginWithGoogle(
      authRepos:
          AuthReposImple(authRemoteDataSource: AuthRemoteDataSourceImpl()));

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

  Future<void> loginWithGoogleMethod() async {
    emit(LoginEmailpasswordLoading());
    var results = await loginWithGoogle.call();
    results.fold((fail) {
      emit(LoginEmailpasswordFailure(errorMessage: fail.errorMessage));
    }, (success) {
      emit(LoginEmailpasswordSuccess());
    });
  }
}
