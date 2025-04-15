import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitesapp/features/home/presentation/cubits/get_featured_products_cubit/get_featured_products_cubit.dart';
import 'package:fruitesapp/features/home/presentation/views/widgets/featued_list_view.dart';
import 'package:fruitesapp/features/products/domain/entities/product_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FeaturedListViewBuilder extends StatelessWidget {
  const FeaturedListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFeaturedProductsCubit, GetFeaturedProductsState>(
      builder: (context, state) {
        if (state is GetFeaturedProductsSuccess) {
          return FeaturedListView(
            featuredProducts: state.featuredProducts,
          );
        } else if (state is GetFeaturedProductsFailure) {
          return Text(state.errorMessage);
        } else {
          return Skeletonizer(
            child: FeaturedListView(featuredProducts: [
              ProductEntity(
                  reviews: [],
                  expirationMonth: 3,
                  isOrganic: true,
                  unitAmount: 1,
                  numOfCalaories: 1,
                  name: 'name',
                  description: 'description',
                  code: 'code',
                  price: 1,
                  isFeaturedItem: true,
                  imagePath: ''),
              ProductEntity(
                  reviews: [],
                  expirationMonth: 3,
                  isOrganic: true,
                  unitAmount: 1,
                  numOfCalaories: 1,
                  name: 'name',
                  description: 'description',
                  code: 'code',
                  price: 1,
                  isFeaturedItem: true,
                  imagePath: ''),
              ProductEntity(
                  reviews: [],
                  expirationMonth: 3,
                  isOrganic: true,
                  unitAmount: 1,
                  numOfCalaories: 1,
                  name: 'name',
                  description: 'description',
                  code: 'code',
                  price: 1,
                  isFeaturedItem: true,
                  imagePath: ''),
              ProductEntity(
                  reviews: [],
                  expirationMonth: 3,
                  isOrganic: true,
                  unitAmount: 1,
                  numOfCalaories: 1,
                  name: 'name',
                  description: 'description',
                  code: 'code',
                  price: 1,
                  isFeaturedItem: true,
                  imagePath: ''),
            ]),
          );
        }
      },
    );
  }
}
