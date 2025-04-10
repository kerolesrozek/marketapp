import 'package:flutter/material.dart';
import 'package:fruitesapp/features/products/domain/entities/product_entity.dart';
import 'package:fruitesapp/features/products/presentation/views/widgets/product_item.dart';

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
