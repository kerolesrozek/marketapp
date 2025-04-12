import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../../products/domain/entities/product_entity.dart';
import 'best_seller_item.dart';

class BestSellerItemsList extends StatelessWidget {
  const BestSellerItemsList({super.key, required this.products});

  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
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
        });
  }
}
