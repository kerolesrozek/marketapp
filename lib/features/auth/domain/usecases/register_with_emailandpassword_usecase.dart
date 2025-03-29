import 'package:dartz/dartz.dart';
import 'package:fruitesapp/core/failures.dart';
import 'package:fruitesapp/features/auth/domain/entities/user_entity.dart';
import 'package:fruitesapp/features/auth/domain/repos/auth_repos.dart';

class RegisterWithEmailandpasswordUsecase {
  final AuthRepos authRepos;

  RegisterWithEmailandpasswordUsecase({required this.authRepos});

  Future<Either<Failures, void>> call({required UserEntity userEntity}) {
    return authRepos.registerWithEmailAndPassword(userEntity: userEntity);
  }
}
