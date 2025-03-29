import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.title,
      this.onPressed,
      required this.isLoading});
  final String title;
  final void Function()? onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 48),
      onPressed: onPressed,
      textColor: Colors.white,
      color: Color(0xff1B5E37),
      minWidth: double.infinity,
      height: 54,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: isLoading == true
          ? CircularProgressIndicator(
              color: Colors.white,
            )
          : Text(
              title,
              style:
                  GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.w700),
            ),
    );
  }
}
