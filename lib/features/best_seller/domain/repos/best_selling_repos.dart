import 'package:dartz/dartz.dart';
import '../../../../core/failures.dart';
import '../../../products/domain/entities/product_entity.dart';

abstract class BestSellingRepos {
  Future<Either<Failures,List<ProductEntity>>>getBestSellingProducts();
} 