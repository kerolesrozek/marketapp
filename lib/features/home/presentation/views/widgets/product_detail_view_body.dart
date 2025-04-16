import 'package:flutter/material.dart';
import 'product_basic_data.dart';
import 'product_extra_data.dart';
import '../../../../on_boarding/presentayon/views/widgets/custom_button.dart';
import '../../../../products/domain/entities/product_entity.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailViewBody extends StatelessWidget {
  const ProductDetailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    ProductEntity productEntity =
        GoRouter.of(context).state.extra as ProductEntity;

    return SingleChildScrollView(
      child: Column(children: [
        ProductBasicData(productEntity: productEntity),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ProductExtraData(
                    productEntity: productEntity,
                    title: 'شهر',
                    subTitle: 'الصلاحية',
                    image: 'lib/assets/images/expiration_background.svg',
                    widget: Text(
                      productEntity.expirationMonth.toString(),
                      style: GoogleFonts.cairo(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 1,
                    ),
                  ),
                  productEntity.isOrganic == true
                      ? ProductExtraData(
                          productEntity: productEntity,
                          title: '100%',
                          subTitle: 'اورجانيك',
                          image: 'lib/assets/images/organic_image.svg',
                        )
                      : SizedBox(),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  ProductExtraData(
                    productEntity: productEntity,
                    title: '${productEntity.numOfCalaories} كالوري',
                    subTitle: '${productEntity.unitAmount} جرام',
                    image: 'lib/assets/images/calaroies_image.svg',
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 1,
                    ),
                  ),
                  ProductExtraData(
                    productEntity: productEntity,
                    title:
                        '${productEntity.averageRating} (${productEntity.reviews.length})',
                    subTitle: 'التقيمات',
                    image: 'lib/assets/images/reviews_image.svg',
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(title: 'اضافه للسله', onPressed: () {}),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
