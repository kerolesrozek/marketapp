import 'package:dartz/dartz.dart';
import '../../../../core/failures.dart';
import '../entities/product_entity.dart';
import '../repos/products_repos.dart';

class GetProductsUsecase {
  final ProductsRepos productsRepos;

  GetProductsUsecase({required this.productsRepos});

  Future<Either<Failures, List<ProductEntity>>> call() async =>
      await productsRepos.getProducts();
}
