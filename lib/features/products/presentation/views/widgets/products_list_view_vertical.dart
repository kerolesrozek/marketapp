
import 'package:flutter/material.dart';
import '../../../../home/presentation/views/widgets/best_seller_item.dart';
import '../../../domain/entities/product_entity.dart';

class ProductsItemsList extends StatelessWidget {
  const ProductsItemsList({super.key, required this.products});

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
