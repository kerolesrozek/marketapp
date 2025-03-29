import 'package:dartz/dartz.dart';
import 'package:fruitesapp/core/failures.dart';
import 'package:fruitesapp/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepos {
  Future<Either<Failures, void>> registerWithEmailAndPassword(
      {required UserEntity userEntity});
}
