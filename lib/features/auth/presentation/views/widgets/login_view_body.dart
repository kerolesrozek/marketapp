import 'package:flutter/material.dart';
import 'package:fruitesapp/features/auth/presentation/views/widgets/dont_have_account_widget.dart';
import 'package:fruitesapp/features/auth/presentation/views/widgets/login_form.dart';
import 'package:fruitesapp/features/auth/presentation/views/widgets/login_with_social_part_widget.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            LoginForm(),
            SizedBox(height: 20),
            DontHaveAccountWidget(),
            SizedBox(height: 16),
            LoginWithSocialsPartWidget(),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
