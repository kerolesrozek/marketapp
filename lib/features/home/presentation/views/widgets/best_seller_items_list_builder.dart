import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../best_seller/presentation/cubits/cubit/get_best_selling_products_cubit.dart';

import 'best_seller_items_list.dart';
import 'loading_list_products.dart';

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
