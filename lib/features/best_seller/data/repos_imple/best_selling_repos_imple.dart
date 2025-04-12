import 'dart:developer';

import 'package:dartz/dartz.dart';
import '../../../../core/failures.dart';
import '../data_sources/best_selling_remote_data_source.dart';
import '../../domain/repos/best_selling_repos.dart';
import '../../../products/domain/entities/product_entity.dart';

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
