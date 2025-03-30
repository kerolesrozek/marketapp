import 'package:dartz/dartz.dart';
import 'package:fruitesapp/core/failures.dart';
import 'package:fruitesapp/features/auth/domain/entities/user_entity.dart';
import 'package:fruitesapp/features/auth/domain/repos/auth_repos.dart';

class LoginWithEmailpasswordUsecase {
  final AuthRepos authRepos;

  LoginWithEmailpasswordUsecase({required this.authRepos});

  Future<Either<Failures, void>> call({required UserEntity userEntity}) async {
    return await authRepos.loginWithEmailAndPassword(userEntity: userEntity);
  }
}
