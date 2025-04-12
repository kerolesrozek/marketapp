import 'package:flutter/material.dart';
import '../../../domain/entities/product_entity.dart';
import 'product_item.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({
    super.key, required this.products,
  });
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          itemCount: products.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ProductItem(
              productEntity: products[index],
            );
          }),
    );
  }
}
