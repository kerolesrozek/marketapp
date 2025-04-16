import 'package:flutter/material.dart';
import 'package:fruitesapp/features/home/presentation/views/widgets/product_detail_view_body.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SafeArea(child: ProductDetailViewBody()),
    );
  }
}
