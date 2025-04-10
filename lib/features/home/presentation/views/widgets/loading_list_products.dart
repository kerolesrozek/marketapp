
import 'package:flutter/material.dart';
import 'package:fruitesapp/features/products/domain/entities/product_entity.dart';
import 'package:fruitesapp/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingListProducts extends StatelessWidget {
  const LoadingListProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 12,
              childAspectRatio: 1 / 1.4,
            ),
            itemBuilder: (context, index) {
              return BestSellerItem(
                productEntity: ProductEntity(
                    reviews: [],
                    expirationMonth: 1,
                    isOrganic: true,
                    unitAmount: 1,
                    numOfCalaories: 1,
                    name: 'mdmd',
                    description: 'description',
                    code: 'code',
                    price: 1,
                    isFeaturedItem: true,
                    imagePath: 'imagePath'),
              );
            }));
  }
}
