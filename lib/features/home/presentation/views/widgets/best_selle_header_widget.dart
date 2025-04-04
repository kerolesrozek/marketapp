import 'package:flutter/material.dart';
import 'package:fruitesapp/core/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class BestSellerHeaderWidget extends StatelessWidget {
  const BestSellerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRoutes.kBestSellerView);
      },
      child: Row(
        children: [
          Text(
            'الأكثر مبيعًا',
            style: GoogleFonts.cairo(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xff0C0D0D)),
          ),
          Spacer(),
          Text('المزيد',
              style: GoogleFonts.cairo(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff949D9E))),
        ],
      ),
    );
  }
}
