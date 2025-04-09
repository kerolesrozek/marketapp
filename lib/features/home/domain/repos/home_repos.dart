import 'package:dartz/dartz.dart';
import 'package:fruitesapp/core/failures.dart';
import 'package:fruitesapp/features/auth/domain/entities/user_entity.dart';
import 'package:fruitesapp/features/home/domain/entities/product_entity.dart';

abstract class HomeRepos {
  Future<Either<Failures, UserEntity>> getuserData({required String uid});
  Future<Either<Failures, List<ProductEntity>>> getProducts();
}
