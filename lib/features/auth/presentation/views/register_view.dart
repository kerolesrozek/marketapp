import 'package:flutter/material.dart';
import 'package:fruitesapp/core/app_routes.dart';
import 'package:fruitesapp/core/consts.dart';
import 'package:fruitesapp/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:fruitesapp/features/auth/presentation/views/widgets/register_view_body.dart';
import 'package:fruitesapp/features/on_boarding/presentayon/views/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' حساب جديد',
          style: GoogleFonts.cairo(fontSize: 19, fontWeight: FontWeight.w700),
        ),
        leading: const Icon(Icons.arrow_back_ios_new),
        centerTitle: true,
        toolbarHeight: 80,
      ),
      body: RegisterViewBody(),
    );
  }
}