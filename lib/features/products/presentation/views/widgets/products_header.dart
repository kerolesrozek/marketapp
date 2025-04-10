import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruitesapp/core/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsHeader extends StatelessWidget {
  const ProductsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // GoRouter.of(context).push(AppRoutes.kproductsView);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('منتجاتنا',
              style:
                  GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.w700)),
          Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(width: 1, color: Colors.grey),
                      right: BorderSide(width: 1, color: Colors.grey),
                      top: BorderSide(width: 1, color: Colors.grey),
                      bottom: BorderSide(width: 1, color: Colors.grey))),
              child: SvgPicture.asset('lib/assets/images/products_filter.svg'))
        ],
      ),
    );
  }
}
