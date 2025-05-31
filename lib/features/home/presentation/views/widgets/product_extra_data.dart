import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:fruitesapp/features/products/domain/entities/product_entity.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductExtraData extends StatelessWidget {
  const ProductExtraData({
    super.key,
    required this.productEntity,
    required this.title,
    required this.subTitle,
    required this.image,
    this.widget,
  });

  final ProductEntity productEntity;
  final String title, subTitle, image;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.40,
      padding: EdgeInsets.symmetric(
        vertical: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                title,
                style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xff23AA49)),
              ),
              Text(
                subTitle,
                style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: Color(0xff979899)),
              ),
            ],
          ),
          Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(image: svg.Svg(image))),
              child: widget ?? Text(''))
        ],
      ),
    );
  }
}
