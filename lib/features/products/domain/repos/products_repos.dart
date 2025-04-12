import 'package:dartz/dartz.dart';
import '../../../../core/failures.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../entities/product_entity.dart';

abstract class ProductsRepos {
  Future<Either<Failures, List<ProductEntity>>> getProducts();
}
