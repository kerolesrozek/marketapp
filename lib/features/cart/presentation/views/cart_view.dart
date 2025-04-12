import 'package:flutter/material.dart';
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
      body: CartViewBody(),
    );
  }
}
