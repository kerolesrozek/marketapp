import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/services/get_it_sevice.dart';
import '../../../../best_seller/presentation/cubits/cubit/get_best_selling_products_cubit.dart';
import '../../../../cart/domain/entities/cart_entity.dart';
import '../../../data/data_sources/home_remote_data_source.dart';
import '../../../data/repos_imple/home_repos_imple.dart';
import '../../../../products/data/data_sources/products_remote_data_source.dart';
import '../../../../products/data/repos_imple/products_repos_imple.dart';
import '../../../domain/usecases/get_user_data_usecase.dart';
import '../../../../products/presentation/cubits/get_products_cubit/get_products_cubit.dart';
import '../../cubits/get_user_data_cubit/get_user_data_cubit.dart';
import 'best_selle_header_widget.dart';
import 'best_seller_item.dart';
import 'best_seller_items_list.dart';
import 'best_seller_items_list_builder.dart';
import 'custom_home_appbar.dart';
import 'custom_text_search_field.dart';
import 'featued_list_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // BlocProvider.of<GetBestSellingProductsCubit>(context)
    //     .getBestSellingProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (context) => GetUserDataCubit(GetUserDataUsecase(
                  homeRepos: HomeReposImple(
                      homeRemoteDataSource: HomeRemoteDataSourceImple())))..getUserData(uid: FirebaseAuth.instance.currentUser!.uid),
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
          BestSellerItemsListBuilder(),
        ],
      ),
    );
  }
}


List<CartEntity> carts=[];