import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/app_routes.dart';
import '../../../../../core/consts.dart';
import '../../../../../core/services/shared_prefrence_singletone.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.title,
      required this.subtititle,
      required this.image,
      required this.backGroundImage,
      this.color,
      required this.currentIndex,
      required this.visibleWord,
      required this.button,
      required this.visibleButton});
  final Widget title;
  final String subtititle;
  final String image;
  final String backGroundImage;
  final Color? color;
  final Widget button;
  final int currentIndex;
  final bool visibleWord;
  final bool visibleButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.50,
          child: Stack(
            children: [
              Positioned(
                child: SvgPicture.asset(
                  backGroundImage,
                  fit: BoxFit.fill,
                  width: double.infinity,
                  color: color,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  image,
                ),
              ),
              Visibility(
                visible: visibleWord,
                child: Positioned(
                    top: 20,
                    right: 10,
                    child: GestureDetector(
                      onTap: () {
                        Prefs.setBool(kIsOnBoardingSeen, true);
                        GoRouter.of(context)
                            .pushReplacement(AppRoutes.kLoginview);
                      },
                      child: Text(
                        'تخط',
                        style: GoogleFonts.cairo(
                            fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                    )),
              )
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            title,
          ],
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.03,
        ),
        Text(
          subtititle,
          textAlign: TextAlign.center,
          style: GoogleFonts.cairo(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xff4E5556)),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.08,
        ),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
              activeColor: Color(0xff1B5E37),
              color: currentIndex == 1
                  ? Color(0xff1B5E37)
                  : Color(0xff1B5E37).withOpacity(0.50)),
        ),
        Expanded(
          child: SizedBox(
            height: 30,
          ),
        ),
        Visibility(
            visible: visibleButton,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 22.0),
              child: button,
            ))
      ],
    );
  }
}
