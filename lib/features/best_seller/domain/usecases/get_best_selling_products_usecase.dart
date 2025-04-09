import 'package:dartz/dartz.dart';
import 'package:fruitesapp/core/failures.dart';
import 'package:fruitesapp/features/best_seller/domain/repos/best_selling_repos.dart';
import 'package:fruitesapp/features/home/domain/entities/product_entity.dart';

class GetBestSellingProductsUsecase {
  final BestSellingRepos bestSellingRepos;

  GetBestSellingProductsUsecase({required this.bestSellingRepos});

  Future<Either<Failures, List<ProductEntity>>> call() async =>
      await bestSellingRepos.getBestSellingProducts();
}
