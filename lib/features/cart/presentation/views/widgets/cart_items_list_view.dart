import 'package:flutter/material.dart';
import '../../../domain/entities/cart_entity.dart';
import 'cart_item.dart';

class CartItemsListView extends StatelessWidget {
  const CartItemsListView({
    super.key,
    required this.cartList,
  });
  final List<CartEntity> cartList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: cartList.length,
          itemBuilder: (context, index) => CartItem(
                cartEntity: cartList[index],
              )),
    );
  }
}
