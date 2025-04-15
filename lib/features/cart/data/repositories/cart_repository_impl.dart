import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:fruitesapp/core/failures.dart';

import 'package:fruitesapp/features/cart/domain/entities/cart_entity.dart';

import '../../domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  List<CartEntity> carts = [];

  @override
  Either<Failures, void> addProductToCart({required CartEntity cartEntity}) {
    try {
      for (var cart in carts) {
        if (cart.productEntity.code == cartEntity.productEntity.code) {
          cart.count += cartEntity.count;
          return right(null);
        }
      }
      return right(carts.add(cartEntity));
    } catch (e) {
      log(' error in cart reposImple.addProductToCart ${e.toString()}');
      return left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Either<Failures, List<CartEntity>> getCarts() {
    try {
      log(carts.toString());
      return right(carts);
    } catch (e) {
      log(' error in cart reposImple.getCarts ${e.toString()}');
      return left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Either<Failures, void> deleteCart({required CartEntity cartEntity}) {
    try {
      carts.remove(cartEntity);
      return right(null);
    } catch (e) {
      log(' error in cart reposImple.deleteCart ${e.toString()}');

      return left(Failures(errorMessage: e.toString()));
    }
  }
}
