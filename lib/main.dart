import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitesapp/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:fruitesapp/features/cart/domain/usecases/add_product_to_cart_usecase.dart';
import 'package:fruitesapp/features/cart/presentation/cubit/add_cart_cubit/add_cart_cubit.dart';
import 'core/app_routes.dart';
import 'core/services/custom_bloc_observer.dart';
import 'core/services/get_it_sevice.dart';
import 'core/services/shared_prefrence_singletone.dart';
import 'features/best_seller/data/data_sources/best_selling_remote_data_source.dart';
import 'features/best_seller/data/repos_imple/best_selling_repos_imple.dart';
import 'features/best_seller/domain/usecases/get_best_selling_products_usecase.dart';
import 'features/best_seller/presentation/cubits/cubit/get_best_selling_products_cubit.dart';

import 'firebase_options.dart';

import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();
  Bloc.observer = CustomBlocObserver();
  await Prefs.init();
  runApp(FruitsMarket());
}

class FruitsMarket extends StatelessWidget {
  const FruitsMarket({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetBestSellingProductsCubit(
              GetBestSellingProductsUsecase(
                  bestSellingRepos: BestSellingReposImple(
                      bestSellingRemoteDataSource:
                          BestSellingRemoteDataSourceImpl())))
            ..getBestSellingProducts(),
        ),
        BlocProvider(
          create: (context) =>
              AddCartCubit(AddCartUseCase(getIt.get<CartRepositoryImpl>())),
        ),
      ],
      child: MaterialApp.router(
        locale: Locale('ar'),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRoutes.router,
      ),
    );
  }
}
