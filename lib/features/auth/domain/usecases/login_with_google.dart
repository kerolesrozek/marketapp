import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruitesapp/core/failures.dart';
import 'package:fruitesapp/features/auth/domain/repos/auth_repos.dart';

class LoginWithGoogle {
  final AuthRepos authRepos;

  LoginWithGoogle({required this.authRepos});

  Future<Either<Failures, UserCredential>> call()async {
    return await authRepos.loginWithGoogle();
  }
}
