import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginSocialWidget extends StatelessWidget {
  const LoginSocialWidget({
    super.key,
    required this.socialName,
    required this.picture, this.onTap,
  });
  final String socialName;
  final String picture;
  final  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(width: 1, color: Color(0xffDDDFDF))),
        child: Row(
          children: [
            Spacer(
              flex: 1,
            ),
            SvgPicture.asset(picture),
            Spacer(
              flex: 4,
            ),
            Text(
              socialName,
              style: GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Spacer(
              flex: 8,
            )
          ],
        ),
      ),
    );
  }
}
