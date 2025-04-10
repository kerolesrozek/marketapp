import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruitesapp/features/products/domain/entities/product_entity.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.productEntity,
  });
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Column(
        children: [
          CircleAvatar(
              backgroundColor: Color(0xffF3F5F7),
              radius: 35,
              child: CachedNetworkImage(
                height: 40,
                fit: BoxFit.fill,
                imageUrl: productEntity.imagePath,
                errorWidget: (context, url, error) => Icon(Icons.error),
              )),
          Text('بطيخ'),
        ],
      ),
    );
  }
}
