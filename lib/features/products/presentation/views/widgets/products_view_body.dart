import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../home/presentation/views/widgets/best_selle_header_widget.dart';
import '../../../../home/presentation/views/widgets/custom_text_search_field.dart';
import 'products_header.dart';
import 'products_items_listview_builder.dart';
import 'products_list_view_builder.dart';

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
            child: Text(
              'المنتجات',
              style: GoogleFonts.cairo(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff0C0D0D)),
            ),
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
