import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitesapp/features/home/data/repos_imple/home_repos_imple.dart';
import 'package:fruitesapp/features/home/domain/usecases/get_featured_products_usecase.dart';
import 'package:fruitesapp/features/home/domain/usecases/get_user_data_usecase.dart';
import 'package:fruitesapp/features/home/presentation/cubits/get_featured_products_cubit/get_featured_products_cubit.dart';
import 'package:fruitesapp/features/home/presentation/views/widgets/featured_list_view_builder.dart';
import '../../../../../core/services/get_it_sevice.dart';
import '../../cubits/get_user_data_cubit/get_user_data_cubit.dart';
import 'best_selle_header_widget.dart';
import 'best_seller_items_list_builder.dart';
import 'custom_home_appbar.dart';
import 'custom_text_search_field.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetFeaturedProductsCubit(
        GetFeaturedProductsUsecase(homeRepos: getIt.get<HomeReposImple>()),
      )..getFeaturedProducts(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: BlocProvider(
                create: (context) => GetUserDataCubit(
                    GetUserDataUsecase(homeRepos: getIt.get<HomeReposImple>()))
                  ..getUserData(uid: FirebaseAuth.instance.currentUser!.uid),
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
              child: FeaturedListViewBuilder(),
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
            BestSellerItemsListBuilder(),
          ],
        ),
      ),
    );
  }
}
