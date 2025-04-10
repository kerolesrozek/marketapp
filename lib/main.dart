import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitesapp/core/app_routes.dart';
import 'package:fruitesapp/core/services/custom_bloc_observer.dart';
import 'package:fruitesapp/core/services/get_it_sevice.dart';
import 'package:fruitesapp/core/services/shared_prefrence_singletone.dart';
import 'package:fruitesapp/features/best_seller/data/data_sources/best_selling_remote_data_source.dart';
import 'package:fruitesapp/features/best_seller/data/repos_imple/best_selling_repos_imple.dart';
import 'package:fruitesapp/features/best_seller/domain/usecases/get_best_selling_products_usecase.dart';
import 'package:fruitesapp/features/best_seller/presentation/cubits/cubit/get_best_selling_products_cubit.dart';

import 'package:fruitesapp/firebase_options.dart';

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
    return BlocProvider(
      create: (context) => GetBestSellingProductsCubit(
          GetBestSellingProductsUsecase(
              bestSellingRepos: BestSellingReposImple(
                  bestSellingRemoteDataSource:
                      BestSellingRemoteDataSourceImpl())))..getBestSellingProducts(),
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
