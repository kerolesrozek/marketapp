import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruitesapp/core/failures.dart';
import 'package:fruitesapp/features/auth/domain/entities/user_entity.dart';
import 'package:fruitesapp/features/products/data/data_sources/products_remote_data_source.dart';
import 'package:fruitesapp/features/products/domain/entities/product_entity.dart';
import 'package:fruitesapp/features/products/domain/repos/products_repos.dart';

class ProductsReposImple extends ProductsRepos {
  final ProductsRemoteDataSource productsRemoteDataSource;

  ProductsReposImple({required this.productsRemoteDataSource});

  @override
  Future<Either<Failures, List<ProductEntity>>> getProducts() async {
    try {
      return right(await productsRemoteDataSource.getProducts());
    } on Exception catch (e) {
      log(' error in home reposImple.getProducts ${e.toString()}');
      return left(Failures(errorMessage: e.toString()));
    }
  }
}
