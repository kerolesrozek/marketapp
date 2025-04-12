import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/login_emailpassword_cubit/login_emailpassword_cubit.dart';
import 'login_social_widget.dart';
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
          onTap: () {
            BlocProvider.of<LoginCubit>(context).loginWithGoogleMethod();
          },
          socialName: 'تسجيل بواسطة جوجل',
          picture: 'lib/assets/images/google Icon.svg',
        ),
        SizedBox(
          height: 16,
        ),
        Platform.isIOS
            ? Column(
                children: [
                  LoginSocialWidget(
                    socialName: 'تسجيل بواسطة أبل',
                    picture: 'lib/assets/images/apple_icon.svg',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              )
            : SizedBox(),
        LoginSocialWidget(
          onTap: () {
            BlocProvider.of<LoginCubit>(context).loginwithfacebook();
          },
          socialName: 'تسجيل بواسطة فيسبوك',
          picture: 'lib/assets/images/facebook_icon.svg',
        ),
      ],
    );
  }
}
