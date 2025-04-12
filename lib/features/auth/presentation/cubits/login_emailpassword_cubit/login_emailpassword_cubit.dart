import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/services/get_it_sevice.dart';
import '../../../data/data_sources/auth_remote_data_source.dart';
import '../../../data/repos_imple/auth_repos_imple.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/login_with_emailpassword_usecase.dart';
import '../../../domain/usecases/login_with_facebooke_usecase.dart';
import '../../../domain/usecases/login_with_google.dart';
import 'package:meta/meta.dart';

part 'login_emailpassword_state.dart';

class LoginCubit extends Cubit<LoginEmailpasswordState> {
  LoginCubit(this.loginWithEmailpasswordUsecase) : super(LoginInitial());
  final LoginWithEmailpasswordUsecase loginWithEmailpasswordUsecase;
  LoginWithGoogle loginWithGoogle =
      LoginWithGoogle(authRepos: getIt.get<AuthReposImple>());
  LoginWithFacebookeUsecase loginWithFacebookeUsecase =
      LoginWithFacebookeUsecase(authRepos: getIt.get<AuthReposImple>());

  Future<void> loginWithEmailAndPassword(
      {required UserEntity userEntity}) async {
    emit(LoginLoading());
    var results =
        await loginWithEmailpasswordUsecase.call(userEntity: userEntity);
    results.fold((ifLeft) {
      emit(LoginFailure(errorMessage: ifLeft.errorMessage));
    }, (ifRight) {
      emit(LoginSuccess());
    });
  }

  Future<void> loginWithGoogleMethod() async {
    emit(LoginLoading());
    var results = await loginWithGoogle.call();
    results.fold((fail) {
      emit(LoginFailure(errorMessage: fail.errorMessage));
    }, (success) {
      emit(LoginSuccess());
    });
  }

  Future<void> loginwithfacebook() async {
    emit(LoginLoading());
    var results = await loginWithFacebookeUsecase.call();
    results.fold((fail) {
      emit(LoginFailure(errorMessage: fail.errorMessage));
    }, (succes) {
      emit(LoginSuccess());
    });
  }
}
