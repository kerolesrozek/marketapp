import 'package:flutter/material.dart';
import 'package:fruitesapp/core/app_routes.dart';
import 'package:fruitesapp/core/consts.dart';
import 'package:fruitesapp/core/services/shared_prefrence_singletone.dart';
import 'package:fruitesapp/features/on_boarding/presentayon/views/widgets/custom_button.dart';
import 'package:fruitesapp/features/on_boarding/presentayon/views/widgets/page_view_item.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingPageView extends StatefulWidget {
  const OnBoardingPageView({super.key});

  @override
  State<OnBoardingPageView> createState() => _OnBoardingPageViewState();
}

class _OnBoardingPageViewState extends State<OnBoardingPageView> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return PageView(
      // reverse: true,
      onPageChanged: (value) {
        currentPage = value;
        setState(() {});
      },
      children: [
        PageViewItem(
          visibleWord: false,
          color: Color(0xffFDF4E2),
          title: Row(
            children: [
              Text(
                'مرحبًا بك في ',
                style: GoogleFonts.cairo(
                    fontSize: 23, fontWeight: FontWeight.w700),
              ),
              Text(
                'HUB',
                style: GoogleFonts.cairo(
                    fontSize: 23,
                    color: Colors.amber,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                'Fruit',
                style: GoogleFonts.cairo(
                    fontSize: 23,
                    color: Colors.green,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          subtititle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          image: 'lib/assets/images/page_view_item_1_image.svg',
          backGroundImage: 'lib/assets/images/page_view_item_1_back_color.svg',
          currentIndex: currentPage,
          button: CustomButton(title: 'تخط',onPressed: () {
            Prefs.setBool(kIsOnBoardingSeen, true);
        GoRouter.of(context).pushReplacement(AppRoutes.kLoginview);
          },),
          visibleButton: false,
        ),
        PageViewItem(
          visibleWord: true,
          button: CustomButton(title: 'ابدأ الان',onPressed: () {
            Prefs.setBool(kIsOnBoardingSeen, true);
        GoRouter.of(context).pushReplacement(AppRoutes.kLoginview);
          },),
          title: Row(
            children: [
              Text(
                'ابحث وتسوق',
                style: GoogleFonts.cairo(
                    fontSize: 23, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          subtititle:
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
          image: 'lib/assets/images/page_item_2_image.svg',
          backGroundImage: 'lib/assets/images/page_view_item2_back_color.svg',
          currentIndex: currentPage,
          visibleButton: true,
        ),
      ],
    );
  }
}
