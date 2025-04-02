import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:fruitesapp/features/home/presentation/views/widgets/featured_button.dart';
import 'package:google_fonts/google_fonts.dart';

class FeaturedWidget extends StatelessWidget {
  const FeaturedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.9,
          // height: MediaQuery.sizeOf(context).height * 0.22,//ملهاش لازمه طالما اديت الليست نفسها ارتفاع
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                  left: 0,
                  bottom: 0,
                  right: MediaQuery.sizeOf(context).width * 0.3,
                  top: 0,
                  child: SvgPicture.asset(
                    'lib/assets/images/page_view_item_1_image.svg',
                    fit: BoxFit.fill,
                  )),
              Container(
                padding: const EdgeInsets.only(
                  right: 20,
                ),
                width: MediaQuery.sizeOf(context).width * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: svg.Svg(
                      'lib/assets/images/feature_image_stack2.svg',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'عروض العيد',
                      style: GoogleFonts.cairo(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    Text('خصم 25%',
                        style: GoogleFonts.cairo(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                    FeauteredButton()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
