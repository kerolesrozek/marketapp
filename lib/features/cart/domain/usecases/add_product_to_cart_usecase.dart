import 'package:dartz/dartz.dart';

import '../../../../core/failures.dart';
import '../entities/cart_entity.dart';
import '../repositories/cart_repository.dart';

class AddCartUseCase {
  final CartRepository repository;

  AddCartUseCase(this.repository);

  Either<Failures, void> call({required CartEntity cartEntity})  =>  repository.addProductToCart(cartEntity: cartEntity);
}
