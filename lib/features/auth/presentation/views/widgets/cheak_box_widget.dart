
import 'package:flutter/material.dart';
import 'package:fruitesapp/core/consts.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox.adaptive(
          value: true,
          onChanged: (onChanged) {},
          activeColor: kBasicColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3)),
        ),
        Expanded(
          child: Text(
            ' من خلال إنشاء حساب ، فإنك توافق على الشروط والأحكام الخاصة بنا',
            style: GoogleFonts.cairo(
                fontSize: 13, fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }
}
