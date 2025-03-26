import 'package:flutter/material.dart';
import 'package:fruitesapp/features/auth/presentation/views/widgets/login_social_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWithSocialsPartWidget extends StatelessWidget {
  const LoginWithSocialsPartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text('او',
                  style: GoogleFonts.cairo(
                      fontSize: 16, fontWeight: FontWeight.w600)),
            ),
            Expanded(
              child: Divider(),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        LoginSocialWidget(
          socialName: 'تسجيل بواسطة جوجل',
          picture: 'lib/assets/images/google Icon.svg',
        ),
        SizedBox(
          height: 16,
        ),
        LoginSocialWidget(
          socialName: 'تسجيل بواسطة أبل',
          picture: 'lib/assets/images/apple_icon.svg',
        ),
        SizedBox(
          height: 16,
        ),
        LoginSocialWidget(
          socialName: 'تسجيل بواسطة فيسبوك',
          picture: 'lib/assets/images/facebook_icon.svg',
        ),
      ],
    );
  }
}
