

import 'package:flutter/material.dart';
import 'package:fruitesapp/core/consts.dart';
import 'package:google_fonts/google_fonts.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('لا تمتلك حساب؟',
            style: GoogleFonts.cairo(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xff949D9E))),
        TextButton(
          onPressed: () {},
          child: Text('قم بإنشاء حساب',
              style: GoogleFonts.cairo(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: kBasicColor)),
        ),
      ],
    );
  }
}
