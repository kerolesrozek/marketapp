
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/presentation/views/widgets/loading_list_products.dart';
import '../../cubits/get_products_cubit/get_products_cubit.dart';
import 'products_list_view_vertical.dart';

class ProductsItemsListViewBuilder extends StatelessWidget {
  const ProductsItemsListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsCubit, GetProductsState>(
      builder: (context, state) {
        if (state is GetProductsSuccess) {
          return ProductsItemsList(products: state.productsList);
        } else if (state is GetProductsFailure) {
          return SliverToBoxAdapter(child: Text(state.errorMessage));
        } else {
          return SliverToBoxAdapter(child: LoadingListProducts());
        }
      },
    );
  }
}
