
import 'package:flutter/material.dart';
import 'package:fruitesapp/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:fruitesapp/features/on_boarding/presentayon/views/widgets/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 8,
        ),
        CustomTextFormField(
          obscureText: false,
          hintText: 'البريد الإلكتروني',
          inputType: TextInputType.emailAddress,
        ),
        SizedBox(height: 20),
        CustomTextFormField(
          obscureText: true,
          hintText: 'كلمة المرور',
          // inputType: TextInputType.visiblePassword,
          iconButton: IconButton(
            onPressed: () {},
            icon: Icon(Icons.visibility),
          ),
        ),
        SizedBox(height: 20),
        Text(
          'نسيت كلمة المرور؟',
          style: GoogleFonts.cairo(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xff2D9F5D)),
        ),
        SizedBox(height: 20),
        CustomButton(
          onPressed: () {},
          title: 'تسجيل دخول', isLoading: false,
        ),
      ],
    );
  }
}
