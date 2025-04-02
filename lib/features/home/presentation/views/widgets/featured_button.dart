
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeauteredButton extends StatelessWidget {
  const FeauteredButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
      onPressed: () {},
      textColor: Color(0xff1B5E37),
      color: Colors.white,
      // minWidth: double.infinity,
      height: 32,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: Text(
        'تسوق الان',
        style: GoogleFonts.cairo(fontSize: 13, fontWeight: FontWeight.w700),
      ),
    );
  }
}
