import 'package:flutter/material.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products Page')),
      body:ProductsViewBody()
    );
  }
}


class ProductsViewBody  extends StatelessWidget {
  const ProductsViewBody ({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
