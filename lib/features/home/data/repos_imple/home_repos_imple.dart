import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruitesapp/features/products/domain/entities/product_entity.dart';
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

  @override
  Future<Either<Failures, List<ProductEntity>>> getFeaturedProducts() async {
    try {
      return right(await homeRemoteDataSource.getFeaturedProducts());
    } catch (e) {
      log(' error in home reposImple.getFeaturedProducts ${e.toString()}');
      return left(Failures(errorMessage: e.toString()));
    }
  }
}
