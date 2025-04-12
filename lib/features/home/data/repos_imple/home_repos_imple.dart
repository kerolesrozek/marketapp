import 'dart:developer';

import 'package:dartz/dartz.dart';
import '../../../../core/failures.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../data_sources/home_remote_data_source.dart';
import '../../domain/repos/home_repos.dart';

class HomeReposImple extends HomeRepos {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeReposImple({required this.homeRemoteDataSource});
  @override
  Future<Either<Failures, UserEntity>> getuserData(
      {required String uid}) async {
    try {
      return right(await homeRemoteDataSource.getUserData(uid: uid));
    } catch (e) {
      log(' error in home reposImple.getuserData ${e.toString()}');
      return left(Failures(errorMessage: e.toString()));
    }
  }
}
