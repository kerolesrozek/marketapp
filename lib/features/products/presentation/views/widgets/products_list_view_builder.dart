
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/product_entity.dart';
import '../../cubits/get_products_cubit/get_products_cubit.dart';
import 'products_list_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsListViewBuilder extends StatelessWidget {
  const ProductsListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsCubit, GetProductsState>(
      builder: (context, state) {
        if (state is GetProductsSuccess) {
          return ProductsListView(
            products: state.productsList,
          );
        } else if (state is GetProductsFailure) {
          return Text(state.errorMessage);
        } else {
          return Skeletonizer(
              child: ProductsListView(products: [
            ProductEntity(
                reviews: [],
                expirationMonth: 1,
                isOrganic: true,
                unitAmount: 1,
                numOfCalaories: 1,
                name: 'name',
                description: 'description',
                code: 'code',
                price: 1,
                isFeaturedItem: true,
                imagePath: 'imagePath'),
          ]));
        }
      },
    );
  }
}
