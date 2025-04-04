import 'package:flutter/material.dart';
import 'package:fruitesapp/features/home/presentation/views/widgets/best_seller_item.dart';

class BestSellerItemsList extends StatelessWidget {
  const BestSellerItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        itemCount: 20,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 12,
          childAspectRatio: 1 / 1.4,
        ),
        itemBuilder: (context, index) {
          return BestSellerItem();
        });
  }
}
