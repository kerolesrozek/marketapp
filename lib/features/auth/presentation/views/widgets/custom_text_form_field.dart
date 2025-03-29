import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.iconButton,
    this.inputType,
    this.onSaved, this.controller, this.autovalidateMode, required this.obscureText,
  });
  final String hintText;
  final Widget? iconButton;
  final TextInputType? inputType;
  final Function(String?)? onSaved;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:obscureText ,
      controller:controller ,
      autovalidateMode:autovalidateMode ,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'هذا الحقل مطلوب';
        }
      },
      keyboardType: inputType,
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
