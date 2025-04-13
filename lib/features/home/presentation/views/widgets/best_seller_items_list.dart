import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitesapp/features/cart/presentation/cubit/add_cart_cubit/add_cart_cubit.dart';
import 'package:fruitesapp/features/cart/presentation/cubit/add_cart_cubit/add_cart_state.dart';
import '../../../../products/domain/entities/product_entity.dart';
import 'best_seller_item.dart';

class BestSellerItemsList extends StatelessWidget {
  const BestSellerItemsList({super.key, required this.products});

  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddCartCubit, CartState>(
      listener: (context, state) {
        if (state is AddCartSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 1),
              content: Text(
                'تم اضافة المنتج الى السلة بنجاح',
              ),
            ),
          );
        }

        if (state is AddCartFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errorMesage,
              ),
            ),
          );
        }
      },
      child: SliverGrid.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 12,
            childAspectRatio: 1 / 1.4,
          ),
          itemBuilder: (context, index) {
            return BestSellerItem(
              productEntity: products[index],
            );
          }),
    );
  }
}
