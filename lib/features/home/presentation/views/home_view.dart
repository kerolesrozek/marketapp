import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitesapp/core/app_routes.dart';
import 'package:fruitesapp/core/consts.dart';
import 'package:fruitesapp/core/services/get_it_sevice.dart';
import 'package:fruitesapp/features/best_seller/data/data_sources/best_selling_remote_data_source.dart';
import 'package:fruitesapp/features/best_seller/data/repos_imple/best_selling_repos_imple.dart';
import 'package:fruitesapp/features/best_seller/domain/usecases/get_best_selling_products_usecase.dart';
import 'package:fruitesapp/features/best_seller/presentation/cubits/cubit/get_best_selling_products_cubit.dart';
import 'package:fruitesapp/features/home/data/repos_imple/home_repos_imple.dart';
import 'package:fruitesapp/features/home/domain/usecases/get_products_usecase.dart';
import 'package:fruitesapp/features/home/presentation/cubits/get_products_cubit/get_products_cubit.dart';
import 'package:fruitesapp/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:fruitesapp/features/products/presentation/views/products_view.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> screens = [
    BlocProvider(
      create: (context) => GetBestSellingProductsCubit(
          GetBestSellingProductsUsecase(
              bestSellingRepos: BestSellingReposImple(
                  bestSellingRemoteDataSource:
                      BestSellingRemoteDataSourceImpl()))),
      child: HomeViewBody(),
    ),
    ProductsView(),
    Center(child: Text('cart')),
    Center(child: Text('profile')),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: screens[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        selectedItemColor: Color(kBasicColor.value),
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الصفحة الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'المنتجات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'سله التسوق',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'حسابي',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            GoRouter.of(context).pushReplacement(AppRoutes.kLoginview);
          },
          child: Icon(Icons.exit_to_app)),
    );
  }
}
