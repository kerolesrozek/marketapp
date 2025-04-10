import 'package:flutter/material.dart';
import 'package:fruitesapp/features/home/presentation/views/widgets/best_selle_header_widget.dart';
import 'package:fruitesapp/features/home/presentation/views/widgets/custom_text_search_field.dart';
import 'package:fruitesapp/features/products/presentation/views/widgets/products_header.dart';
import 'package:fruitesapp/features/products/presentation/views/widgets/products_items_listview_builder.dart';
import 'package:fruitesapp/features/products/presentation/views/widgets/products_list_view_builder.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomTextSearchField(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverToBoxAdapter(
            child: ProductsHeader(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 15),
          ),
          SliverToBoxAdapter(
            child: ProductsListViewBuilder(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 15),
          ),
          SliverToBoxAdapter(
            child: BestSellerHeaderWidget(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          ProductsItemsListViewBuilder()
        ],
      ),
    );
  }
}
