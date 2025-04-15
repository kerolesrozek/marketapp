import 'package:dartz/dartz.dart';
import 'package:fruitesapp/core/failures.dart';
import 'package:fruitesapp/features/home/domain/repos/home_repos.dart';
import 'package:fruitesapp/features/products/domain/entities/product_entity.dart';

class GetFeaturedProductsUsecase {
  final HomeRepos homeRepos;

  GetFeaturedProductsUsecase({required this.homeRepos});

  Future<Either<Failures, List<ProductEntity>>> call() async => await homeRepos.getFeaturedProducts();
}