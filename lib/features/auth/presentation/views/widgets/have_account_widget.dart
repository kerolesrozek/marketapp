
import 'package:flutter/material.dart';
import 'package:fruitesapp/core/app_routes.dart';
import 'package:fruitesapp/core/consts.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HaveAccountWidget extends StatelessWidget {
  const HaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('تمتلك حساب بالفعل؟',
            style: GoogleFonts.cairo(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xff949D9E))),
        TextButton(
          onPressed: () {
            GoRouter.of(context).push(AppRoutes.kLoginview);
          },
          child: Text('تسجيل دخول',
              style: GoogleFonts.cairo(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: kBasicColor)),
        ),
      ],
    );
  }
}
