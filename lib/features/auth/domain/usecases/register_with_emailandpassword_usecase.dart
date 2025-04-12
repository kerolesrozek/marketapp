import 'package:dartz/dartz.dart';
import '../../../../core/failures.dart';
import '../entities/user_entity.dart';
import '../repos/auth_repos.dart';

class RegisterWithEmailandpasswordUsecase {
  final AuthRepos authRepos;

  RegisterWithEmailandpasswordUsecase({required this.authRepos});

  Future<Either<Failures, void>> call({required UserEntity userEntity}) {
    return authRepos.registerWithEmailAndPassword(userEntity: userEntity);
  }
}
