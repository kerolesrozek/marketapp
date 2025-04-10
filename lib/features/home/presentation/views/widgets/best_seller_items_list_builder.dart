import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitesapp/features/best_seller/presentation/cubits/cubit/get_best_selling_products_cubit.dart';

import 'package:fruitesapp/features/home/presentation/views/widgets/best_seller_items_list.dart';
import 'package:fruitesapp/features/home/presentation/views/widgets/loading_list_products.dart';

class BestSellerItemsListBuilder extends StatelessWidget {
  const BestSellerItemsListBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBestSellingProductsCubit,
        GetBestSellingProductsState>(
      builder: (context, state) {
        if (state is GetBestSellingProductsSuccess) {
          return BestSellerItemsList(
            products: state.bestSellingProducts,
          );
        } else if (state is GetBestSellingProductsFailure) {
          return SliverToBoxAdapter(
            child: Text(state.errorMessage),
          );
        } else {
          return SliverToBoxAdapter(child: LoadingListProducts());
        }
      },
    );
  }
}
