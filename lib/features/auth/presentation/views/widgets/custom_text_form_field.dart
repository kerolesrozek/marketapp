import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.iconButton, this.inputType,
  });
  final String hintText;
  final Widget? iconButton;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:inputType, 
      decoration: InputDecoration(
        
          filled: true,
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(16),
          suffixIcon: iconButton,
          fillColor: Color(0xffF9FAFA),
          hintText: hintText,
          hintStyle:
              GoogleFonts.cairo(fontSize: 13, fontWeight: FontWeight.w700)),
    );
  }
}
