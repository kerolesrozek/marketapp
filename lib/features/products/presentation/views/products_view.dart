import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/services/get_it_sevice.dart';
import '../../data/repos_imple/products_repos_imple.dart';
import '../../domain/usecases/get_products_usecase.dart';
import '../cubits/get_products_cubit/get_products_cubit.dart';
import 'widgets/products_view_body.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetProductsCubit(
          GetProductsUsecase(productsRepos: getIt.get<ProductsReposImple>()))..getProducts(),
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'المنتجات',
              style:
                  GoogleFonts.cairo(fontSize: 19, fontWeight: FontWeight.w700),
            ),
            actions: [
              Container(
                  padding: EdgeInsets.all(12),
                  decoration: ShapeDecoration(
                      shape: OvalBorder(), color: Color(0xffEEF8ED)),
                  child:
                      SvgPicture.asset('lib/assets/images/notification.svg')),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          body: SafeArea(child: ProductsViewBody())),
    );
  }
}
