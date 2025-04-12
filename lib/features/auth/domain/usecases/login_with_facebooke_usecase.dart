import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/failures.dart';
import '../repos/auth_repos.dart';

class LoginWithFacebookeUsecase {
  final AuthRepos authRepos;

  LoginWithFacebookeUsecase({required this.authRepos});

  Future<Either<Failures, void>> call() async {
    return await authRepos.loginWithFacebook();
  }
}
