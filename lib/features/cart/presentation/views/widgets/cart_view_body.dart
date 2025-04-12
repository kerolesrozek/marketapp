import 'package:flutter/material.dart';
import 'cart_items_list_view.dart';
import '../../../../home/presentation/views/widgets/home_view_body.dart';
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
          CartItemsListView(
            cartList: [],
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
