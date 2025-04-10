

import 'package:dartz/dartz.dart';
import 'package:fruitesapp/core/failures.dart';
import 'package:fruitesapp/features/auth/domain/entities/user_entity.dart';
import 'package:fruitesapp/features/home/domain/repos/home_repos.dart';

class GetUserDataUsecase {
  final HomeRepos homeRepos;

  GetUserDataUsecase({required this.homeRepos});

  Future<Either<Failures, UserEntity>> call({required String uid}) async =>
      await homeRepos.getuserData(uid: uid);
}
