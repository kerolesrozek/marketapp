import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/cubit/get_best_selling_products_cubit.dart';
import '../../../../home/presentation/views/widgets/best_seller_items_list.dart';
import '../../../../home/presentation/views/widgets/best_seller_items_list_builder.dart';
import '../../../../home/presentation/views/widgets/loading_list_products.dart';
import 'package:google_fonts/google_fonts.dart';

class BestSellerViewBody extends StatefulWidget {
  const BestSellerViewBody({super.key});

  @override
  State<BestSellerViewBody> createState() => _BestSellerViewBodyState();
}

class _BestSellerViewBodyState extends State<BestSellerViewBody> {
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
          BestSellerItemsListBuilder(
           
          )
        ],
      ),
    );
  }
}
