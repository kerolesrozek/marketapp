import 'package:dartz/dartz.dart';
import '../../../../core/failures.dart';
import '../entities/cart_entity.dart';

abstract class CartRepository {
  Either<Failures, void> addProductToCart({required CartEntity cartEntity});
  Either<Failures, List<CartEntity>> getCarts();
}
