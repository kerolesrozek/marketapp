import 'package:flutter/material.dart';
import 'package:fruitesapp/features/home/presentation/views/widgets/best_seller_items_list.dart';
import 'package:google_fonts/google_fonts.dart';

class BestSellerViewBody extends StatelessWidget {
  const BestSellerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Text('الأكثر مبيعًا',
                style: GoogleFonts.cairo(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                )),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          BestSellerItemsList(),
        ],
      ),
    );
  }
}
