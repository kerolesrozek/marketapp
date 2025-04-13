import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitesapp/core/services/get_it_sevice.dart';
import 'package:fruitesapp/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:fruitesapp/features/cart/domain/usecases/get_carts_usecase.dart';
import 'package:fruitesapp/features/cart/presentation/cubit/get_carts_cubit/get_carts_cubit.dart';
import 'widgets/cart_view_body.dart';
import 'package:google_fonts/google_fonts.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'سله التسوق',
          style: GoogleFonts.cairo(fontSize: 19, fontWeight: FontWeight.w700),
        ),
      ),
      body: BlocProvider(
        create: (context) => GetCartsCubit(
          GetCartsUsecase(cartRepository: getIt.get<CartRepositoryImpl>())
        )..getCarts(),
        child: CartViewBody(),
      ),
    );
  }
}
