import 'package:flutter/material.dart';
import 'dont_have_account_widget.dart';
import 'login_form.dart';
import 'login_with_social_part_widget.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key, required this.isLoading});
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            LoginForm(isLoading: isLoading,),
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
