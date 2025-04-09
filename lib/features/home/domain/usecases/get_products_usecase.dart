import 'package:dartz/dartz.dart';
import 'package:fruitesapp/core/failures.dart';
import 'package:fruitesapp/features/home/domain/entities/product_entity.dart';
import 'package:fruitesapp/features/home/domain/repos/home_repos.dart';

class GetProductsUsecase {
  final HomeRepos homeRepos;

  GetProductsUsecase({required this.homeRepos});

  Future<Either<Failures, List<ProductEntity>>> call ()async =>await homeRepos.getProducts();
}
