import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruitesapp/core/app_routes.dart';
import 'package:fruitesapp/core/consts.dart';
import 'package:fruitesapp/core/services/shared_prefrence_singletone.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    navigationAfterSplash();
  }

  Future<void> navigationAfterSplash() {
    return Future.delayed(
        Duration(
          seconds: 3,
        ), () {
      if (mounted) {
        if (Prefs.getBool(kIsOnBoardingSeen)) {
          GoRouter.of(context).pushReplacement(AppRoutes.kLoginview);
        } else {
          GoRouter.of(context).pushReplacement(AppRoutes.kOnBoardingView);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: SvgPicture.asset(
                'lib/assets/images/freepik--Plant--inject-63.svg')),
        SvgPicture.asset('lib/assets/images/2g9aivNDMxq2VjIoppWWAdWqn89 1.svg'),
        SvgPicture.asset(
          'lib/assets/images/freepik--Circles--inject-5.svg',
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
