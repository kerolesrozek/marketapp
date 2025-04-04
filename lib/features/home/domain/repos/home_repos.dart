import 'package:dartz/dartz.dart';
import 'package:fruitesapp/core/failures.dart';
import 'package:fruitesapp/features/auth/domain/entities/user_entity.dart';

abstract class HomeRepos {
  Future<Either<Failures, UserEntity>> getuserData({required String uid});
}
