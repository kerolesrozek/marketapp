import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruitesapp/core/app_routes.dart';
import 'package:fruitesapp/features/products/domain/entities/product_entity.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductBasicData extends StatelessWidget {
  const ProductBasicData({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.4,
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: SvgPicture.asset(
                  'lib/assets/images/product_detail_background.svg',
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: CachedNetworkImage(
                  imageUrl: productEntity.imagePath,
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productEntity.name,
                      style: GoogleFonts.cairo(
                          fontSize: 16, fontWeight: FontWeight.w700)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${productEntity.price} جنيه/${productEntity.unitAmount}كيلو',
                    style: GoogleFonts.cairo(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.amber),
                  ),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  'lib/assets/images/plus_item_in_cart_view.svg',
                  width: 36,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '4',
                style: GoogleFonts.cairo(
                    fontSize: 18, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  
                },
                child: SvgPicture.asset(
                  'lib/assets/images/minus_item_in_cart_view.svg',
                  width: 36,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              SizedBox(
                width: 8,
              ),
              Text(productEntity.averageRating.toString(),
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(
                width: 8,
              ),
              Text(
                '(${productEntity.reviews.length})',
              ),
              SizedBox(
                width: 8,
              ),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context)
                      .push(AppRoutes.kProductReviewView, extra: productEntity);
                },
                child: Text(
                  'المراجعه',
                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w700,
                      color: Color(0xff1B5E37),
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xff1B5E37)),
                ),
              ),
              SizedBox(
                width: 8,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            productEntity.description,
            style: GoogleFonts.cairo(color: Color(0xff979899)),
          ),
        ),
      ],
    );
  }
}
