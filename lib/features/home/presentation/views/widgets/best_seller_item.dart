import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../cart/domain/entities/cart_entity.dart';
import 'home_view_body.dart';
import '../../../../products/domain/entities/product_entity.dart';
import 'package:google_fonts/google_fonts.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({
    super.key,
    required this.productEntity,
  });
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1.4,
      child: Container(
        decoration: BoxDecoration(
          color: Color(
            0xffF3F5F7,
          ),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: CachedNetworkImage(
                imageUrl: productEntity.imagePath,
                // placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        productEntity.name,
                        style: GoogleFonts.cairo(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            '${productEntity.price} جنيه/${productEntity.unitAmount}كيلو',
                            style: GoogleFonts.cairo(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Colors.amber),
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color(0xff1B5E37),
                            ),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                )))
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: 10,
                right: 10,
                child: SvgPicture.asset('lib/assets/images/heart.svg'))
          ],
        ),
      ),
    );
  }
}
