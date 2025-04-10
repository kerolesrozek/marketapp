import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruitesapp/features/best_seller/data/data_sources/best_selling_remote_data_source.dart';
import 'package:fruitesapp/features/best_seller/data/repos_imple/best_selling_repos_imple.dart';
import 'package:fruitesapp/features/best_seller/domain/usecases/get_best_selling_products_usecase.dart';
import 'package:fruitesapp/features/best_seller/presentation/cubits/cubit/get_best_selling_products_cubit.dart';
import 'package:fruitesapp/features/best_seller/presentation/views/widgets/best_Seller_view_body.dart';
import 'package:fruitesapp/features/home/presentation/views/widgets/best_seller_items_list.dart';
import 'package:fruitesapp/features/home/presentation/views/widgets/custom_home_appbar.dart';
import 'package:google_fonts/google_fonts.dart';

class BestSellerView extends StatelessWidget {
  const BestSellerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'الأكثر مبيعًا',
          style: GoogleFonts.cairo(fontSize: 19, fontWeight: FontWeight.w700),
        ),
        actions: [
          Container(
              padding: EdgeInsets.all(12),
              decoration: ShapeDecoration(
                  shape: OvalBorder(), color: Color(0xffEEF8ED)),
              child: SvgPicture.asset('lib/assets/images/notification.svg')),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SafeArea(
          child: BestSellerViewBody()),
    );
  }
}
