import 'package:dartz/dartz.dart';
import '../../../../core/failures.dart';
import '../entities/user_entity.dart';

abstract class AuthRepos {
  Future<Either<Failures, void>> registerWithEmailAndPassword(
      {required UserEntity userEntity});
  Future<Either<Failures, void>> addUser({required UserEntity userEntity});
  Future<Either<Failures, void>> loginWithEmailAndPassword(
      {required UserEntity userEntity});
  Future<Either<Failures, void>> loginWithGoogle();

  Future<Either<Failures, void>> loginWithFacebook();
}
