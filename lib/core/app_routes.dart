import '../features/auth/presentation/views/login_view.dart';
import '../features/auth/presentation/views/register_view.dart';
import '../features/best_seller/presentation/views/best_seller_view.dart';
import '../features/home/presentation/views/home_view.dart';
import '../features/on_boarding/presentayon/views/on_boarding_view.dart';

import '../features/splash/presentation/views/spalsh_view.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final kOnBoardingView = '/kOnBoadingView';

  static final kLoginview = '/kLoginview';
  static final kRegisterView = '/kRegisterView';
  static final kHomeView = '/kHomeView';

  static final kBestSellerView = '/kBestSellerView';
  // static final kproductsView = '/kproductsView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kOnBoardingView,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: kLoginview,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
          path: kRegisterView,
          builder: (context, state) => const RegisterView()),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(
          path: kBestSellerView,
          builder: (context, state) => const BestSellerView()),
      // GoRoute(
      //     path: kproductsView,
      //     builder: (context, state) => const ProductsView()),
    ],
  );
}
