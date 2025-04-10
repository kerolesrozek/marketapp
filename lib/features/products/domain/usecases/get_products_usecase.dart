import 'package:dartz/dartz.dart';
import 'package:fruitesapp/core/failures.dart';
import 'package:fruitesapp/features/products/domain/entities/product_entity.dart';
import 'package:fruitesapp/features/products/domain/repos/products_repos.dart';

class GetProductsUsecase {
  final ProductsRepos productsRepos;

  GetProductsUsecase({required this.productsRepos});

  Future<Either<Failures, List<ProductEntity>>> call() async =>
      await productsRepos.getProducts();
}
