
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitesapp/features/cart/presentation/cubit/get_carts_cubit/get_carts_cubit.dart';
import 'package:fruitesapp/features/cart/presentation/views/widgets/cart_items_list_view.dart';
import 'package:fruitesapp/features/on_boarding/presentayon/views/widgets/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';

class CartViewBodyBuilder extends StatelessWidget {
  const CartViewBodyBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCartsCubit, GetCartsState>(
      builder: (context, state) {
        if (state is GetCartsSuccess) {
          num calcTotalPrice() {
            num totalPrice = 0;
            for (var element in state.carts) {
              totalPrice += element.productEntity.price * element.count;
            }
            return totalPrice;
          }
    
          return Stack(children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  width: double.infinity,
                  color: Color(0xffEBF9F1),
                  child: Center(
                    child: Text(
                      'لديك ${state.carts.length} منتجات في سله التسوق',
                      style: GoogleFonts.cairo(
                          fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CartItemsListView(
                  cartList: state.carts,
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
                child: CustomButton(
                    title: 'الدفع ${calcTotalPrice()} جنيه', onPressed: () {})),
          ]);
        } else if (state is GetCartsFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
