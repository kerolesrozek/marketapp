import 'package:dartz/dartz.dart';
import '../../../../core/failures.dart';
import '../entities/user_entity.dart';
import '../repos/auth_repos.dart';

class LoginWithEmailpasswordUsecase {
  final AuthRepos authRepos;

  LoginWithEmailpasswordUsecase({required this.authRepos});

  Future<Either<Failures, void>> call({required UserEntity userEntity}) async {
    return await authRepos.loginWithEmailAndPassword(userEntity: userEntity);
  }
}
