import 'package:dartz/dartz.dart';
import 'package:fruitesapp/core/failures.dart';
import 'package:fruitesapp/features/auth/domain/entities/user_entity.dart';
import 'package:fruitesapp/features/products/domain/entities/product_entity.dart';

abstract class ProductsRepos {
  Future<Either<Failures, List<ProductEntity>>> getProducts();
}
