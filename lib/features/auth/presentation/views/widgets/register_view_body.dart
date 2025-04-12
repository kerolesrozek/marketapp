import 'package:flutter/material.dart';

import 'have_account_widget.dart';
import 'register_form.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key, required this.isLoading});
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            RegisterForm(
              isLoading: isLoading,
            ),
            HaveAccountWidget(),
          ],
        ),
      ),
    );
  }
}
