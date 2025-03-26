import 'package:flutter/material.dart';
import 'package:fruitesapp/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'تسجيل دخول',
          style: GoogleFonts.cairo(fontSize: 19, fontWeight: FontWeight.w700),
        ),
        leading: const Icon(Icons.arrow_back_ios_new),
        centerTitle: true,
        toolbarHeight: 80,
      ),
      body: SafeArea(child: LoginViewBody()),
    );
  }
}
