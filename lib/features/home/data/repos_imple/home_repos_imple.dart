import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruitesapp/core/failures.dart';
import 'package:fruitesapp/features/auth/domain/entities/user_entity.dart';
import 'package:fruitesapp/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:fruitesapp/features/home/domain/entities/product_entity.dart';
import 'package:fruitesapp/features/home/domain/repos/home_repos.dart';

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

  @override
  Future<Either<Failures, List<ProductEntity>>> getProducts() async {
    try {
      return right(await homeRemoteDataSource.getProducts());
    } on Exception catch (e) {
      log(' error in home reposImple.getProducts ${e.toString()}');
      return left(Failures(errorMessage: e.toString()));
    }
  }
}
