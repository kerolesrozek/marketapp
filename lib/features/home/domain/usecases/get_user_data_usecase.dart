

import 'package:dartz/dartz.dart';
import '../../../../core/failures.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../repos/home_repos.dart';

class GetUserDataUsecase {
  final HomeRepos homeRepos;

  GetUserDataUsecase({required this.homeRepos});

  Future<Either<Failures, UserEntity>> call({required String uid}) async =>
      await homeRepos.getuserData(uid: uid);
}
