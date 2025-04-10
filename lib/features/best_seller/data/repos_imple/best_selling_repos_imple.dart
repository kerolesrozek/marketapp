import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruitesapp/core/failures.dart';
import 'package:fruitesapp/features/best_seller/data/data_sources/best_selling_remote_data_source.dart';
import 'package:fruitesapp/features/best_seller/domain/repos/best_selling_repos.dart';
import 'package:fruitesapp/features/products/domain/entities/product_entity.dart';

class BestSellingReposImple extends BestSellingRepos {
  final BestSellingRemoteDataSource bestSellingRemoteDataSource;

  BestSellingReposImple({required this.bestSellingRemoteDataSource});
  @override
  Future<Either<Failures, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      return right(await bestSellingRemoteDataSource.getBestSellingProducts());
    } catch (e) {
      log(' error in best selling reposImple.getBestSellingProducts ${e.toString()}');
      return left(Failures(errorMessage: e.toString()));
    }
  }
}
