import 'package:flutter/material.dart';
import 'package:fruitesapp/features/home/presentation/views/widgets/custom_home_appbar.dart';
import 'package:fruitesapp/features/home/presentation/views/widgets/custom_text_search_field.dart';
import 'package:fruitesapp/features/home/presentation/views/widgets/featued_list_view.dart';

import 'package:fruitesapp/features/home/presentation/views/widgets/featured_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomHomeAppBar(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),
          SliverToBoxAdapter(
            child: CustomTextSearchField(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),
          SliverToBoxAdapter(
            child: FeaturedListView(),
          )
        ],
      ),
    );
  }
}
