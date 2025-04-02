import 'package:fruitesapp/features/auth/presentation/views/login_view.dart';
import 'package:fruitesapp/features/auth/presentation/views/register_view.dart';
import 'package:fruitesapp/features/home/presentation/views/home_view.dart';
import 'package:fruitesapp/features/on_boarding/presentayon/views/on_boarding_view.dart';
import 'package:fruitesapp/features/splash/presentation/views/spalsh_view.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final kOnBoardingView = '/kOnBoadingView';

  static final kLoginview = '/kLoginview';
  static final kRegisterView = '/kRegisterView';
  static final kHomeView = '/kHomeView';
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
           GoRoute(
          path: kHomeView,
          builder: (context, state) => const HomeView()),
    ],
  );
}
