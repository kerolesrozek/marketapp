import 'package:dartz/dartz.dart';
import 'package:fruitesapp/core/failures.dart';
import 'package:fruitesapp/features/cart/domain/entities/cart_entity.dart';
import 'package:fruitesapp/features/cart/domain/repositories/cart_repository.dart';

class GetCartsUsecase {
  final CartRepository cartRepository;

  GetCartsUsecase({required this.cartRepository});

  Either<Failures, List<CartEntity>> call() {
    return cartRepository.getCarts();
  }
}
