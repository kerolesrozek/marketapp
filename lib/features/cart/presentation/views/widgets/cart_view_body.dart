import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitesapp/features/cart/presentation/cubit/get_carts_cubit/get_carts_cubit.dart';
import 'cart_items_list_view.dart';
import '../../../../on_boarding/presentayon/views/widgets/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 12),
            width: double.infinity,
            color: Color(0xffEBF9F1),
            child: Center(
              child: Text(
                'لديك 3 منتجات في سله التسوق',
                style: GoogleFonts.cairo(
                    fontSize: 13, fontWeight: FontWeight.w400),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          BlocBuilder<GetCartsCubit, GetCartsState>(
            builder: (context, state) {
              if (state is GetCartsSuccess) {
                return CartItemsListView(
                  cartList: state.carts,
                );
              } else if (state is GetCartsFailure) {
                return Text(state.errorMessage);
              } else {
                return Text('data');
              }
            },
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
      Positioned(
          bottom: MediaQuery.sizeOf(context).height * 0.07,
          right: 16,
          left: 16,
          child: CustomButton(title: 'الدفع 120 جنيه', onPressed: () {})),
    ]);
  }
}
