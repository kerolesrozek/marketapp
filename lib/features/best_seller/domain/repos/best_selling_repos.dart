import 'package:dartz/dartz.dart';
import 'package:fruitesapp/core/failures.dart';
import 'package:fruitesapp/features/home/domain/entities/product_entity.dart';

abstract class BestSellingRepos {
  Future<Either<Failures,List<ProductEntity>>>getBestSellingProducts();
} 