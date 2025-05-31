import 'package:flutter/material.dart';
import 'package:fruitesapp/features/home/presentation/views/widgets/product_review_view_body.dart';

class ProductReviewView extends StatelessWidget {
  const ProductReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('المراجعه'),
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ProductReviewViewBody(),
      )),
    );
  }
}
