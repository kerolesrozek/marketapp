import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitesapp/core/services/get_it_sevice.dart';
import 'package:fruitesapp/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:fruitesapp/features/home/data/repos_imple/home_repos_imple.dart';
import 'package:fruitesapp/features/home/domain/usecases/get_user_data_usecase.dart';
import 'package:fruitesapp/features/home/presentation/cubits/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:fruitesapp/features/home/presentation/views/widgets/best_selle_header_widget.dart';
import 'package:fruitesapp/features/home/presentation/views/widgets/best_seller_items_list.dart';
import 'package:fruitesapp/features/home/presentation/views/widgets/custom_home_appbar.dart';
import 'package:fruitesapp/features/home/presentation/views/widgets/custom_text_search_field.dart';
import 'package:fruitesapp/features/home/presentation/views/widgets/featued_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (context) => GetUserDataCubit(GetUserDataUsecase(
                  homeRepos:getIt.get<HomeReposImple>())),
              child: CustomHomeAppBar(),
            ),
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
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: BestSellerHeaderWidget(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          BestSellerItemsList(),
        ],
      ),
    );
  }
}
