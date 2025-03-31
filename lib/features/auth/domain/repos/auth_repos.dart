import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruitesapp/core/failures.dart';
import 'package:fruitesapp/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepos {
  Future<Either<Failures, void>> registerWithEmailAndPassword(
      {required UserEntity userEntity});
  Future<Either<Failures, void>> addUser({required UserEntity userEntity});
  Future<Either<Failures, void>> loginWithEmailAndPassword(
      {required UserEntity userEntity});
      Future <Either<Failures, UserCredential>> loginWithGoogle();

      Future<Either<Failures,UserCredential>>loginWithFacebook();
}
