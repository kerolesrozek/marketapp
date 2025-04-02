
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Image.asset(
          'lib/assets/images/profile_image.png',
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        'صباح الخير !..',
        style: GoogleFonts.cairo(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Color(0xff949D9E),
        ),
      ),
      subtitle: Text(
        'أحمد مصطفي',
        style: GoogleFonts.cairo(
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: Color(0xff0C0D0D),
        ),
      ),
      trailing: Container(
          padding: EdgeInsets.all(12),
          decoration:
              ShapeDecoration(shape: OvalBorder(), color: Color(0xffEEF8ED)),
          child: SvgPicture.asset('lib/assets/images/notification.svg')),
    );
  }
}
