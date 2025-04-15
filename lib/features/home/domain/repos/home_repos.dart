import 'package:dartz/dartz.dart';
import 'package:fruitesapp/features/products/domain/entities/product_entity.dart';
import '../../../../core/failures.dart';
import '../../../auth/domain/entities/user_entity.dart';

abstract class HomeRepos {
    Future<Either<Failures, UserEntity>> getuserData({required String uid});
    Future<Either<Failures,List<ProductEntity>>>getFeaturedProducts();
    

}