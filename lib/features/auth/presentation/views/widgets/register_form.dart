

import 'package:flutter/material.dart';
import 'package:fruitesapp/core/consts.dart';
import 'package:fruitesapp/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:fruitesapp/features/on_boarding/presentayon/views/widgets/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 8,
        ),
        CustomTextFormField(
          hintText: 'الاسم كامل',
          inputType: TextInputType.emailAddress,
        ),
        SizedBox(height: 20),
        CustomTextFormField(
          hintText: 'البريد الإلكتروني',
          // inputType: TextInputType.visiblePassword,
        ),
        SizedBox(height: 20),
        CustomTextFormField(
          hintText: 'كلمة المرور',
          // inputType: TextInputType.visiblePassword,
          iconButton: IconButton(
            onPressed: () {},
            icon: Icon(Icons.visibility),
          ),
        ),
        SizedBox(height: 20),
        Row(
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
        ),
        SizedBox(height: 20),
        CustomButton(
          onPressed: () {},
          title: 'تسجيل دخول',
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
