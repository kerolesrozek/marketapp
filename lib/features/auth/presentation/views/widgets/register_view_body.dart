import 'package:flutter/material.dart';

import 'package:fruitesapp/features/auth/presentation/views/widgets/have_account_widget.dart';
import 'package:fruitesapp/features/auth/presentation/views/widgets/register_form.dart';

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
