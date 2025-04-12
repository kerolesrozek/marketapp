import 'package:dartz/dartz.dart';
import '../../../../core/failures.dart';
import '../repos/best_selling_repos.dart';
import '../../../products/domain/entities/product_entity.dart';

class GetBestSellingProductsUsecase {
  final BestSellingRepos bestSellingRepos;

  GetBestSellingProductsUsecase({required this.bestSellingRepos});

  Future<Either<Failures, List<ProductEntity>>> call() async =>
      await bestSellingRepos.getBestSellingProducts();
}
