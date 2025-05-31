import 'package:flutter/material.dart';
import 'package:fruitesapp/features/products/domain/entities/product_entity.dart';
import 'featured_widget.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({
    super.key, required this.featuredProducts,
  });
 final List<ProductEntity> featuredProducts;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.22,
      child: ListView.builder(      
        scrollDirection: Axis.horizontal,
        itemCount: featuredProducts.length,
        itemBuilder: (BuildContext context, int index) {
          return FeaturedWidget(productEntity: featuredProducts[index],);
        },
      ),
    );
  }
}
