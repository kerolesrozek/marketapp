import 'package:dartz/dartz.dart';
import 'package:fruitesapp/core/failures.dart';
import 'package:fruitesapp/features/cart/domain/entities/cart_entity.dart';
import 'package:fruitesapp/features/cart/domain/repositories/cart_repository.dart';

class DeleteCartUsecase {
  final CartRepository cartRepository;

  DeleteCartUsecase({required this.cartRepository});

  Either<Failures, void> call({required CartEntity cartEntity}) {
    return cartRepository.deleteCart(cartEntity: cartEntity);
  }
}
