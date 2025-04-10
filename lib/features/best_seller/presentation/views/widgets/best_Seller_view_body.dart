import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitesapp/features/best_seller/presentation/cubits/cubit/get_best_selling_products_cubit.dart';
import 'package:fruitesapp/features/home/presentation/views/widgets/best_seller_items_list.dart';
import 'package:fruitesapp/features/home/presentation/views/widgets/best_seller_items_list_builder.dart';
import 'package:fruitesapp/features/home/presentation/views/widgets/loading_list_products.dart';
import 'package:google_fonts/google_fonts.dart';

class BestSellerViewBody extends StatefulWidget {
  const BestSellerViewBody({super.key});

  @override
  State<BestSellerViewBody> createState() => _BestSellerViewBodyState();
}

class _BestSellerViewBodyState extends State<BestSellerViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // context.read<GetBestSellingProductsCubit>().getBestSellingProducts();
  }

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
          BestSellerItemsListBuilder()
        ],
      ),
    );
  }
}
