import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitesapp/features/auth/domain/entities/user_entity.dart';
import 'package:fruitesapp/features/auth/presentation/cubits/login_emailpassword_cubit/login_emailpassword_cubit.dart';
import 'package:fruitesapp/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:fruitesapp/features/auth/presentation/views/widgets/custtom_password_textfield.dart';
import 'package:fruitesapp/features/on_boarding/presentayon/views/widgets/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email;
  late String password;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginEmailpasswordCubit, LoginEmailpasswordState>(
      listener: (context, state) {
        if (state is LoginEmailpasswordSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('تم تسجيل الدخول بنجاح')));
        }
        if (state is LoginEmailpasswordFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is LoginEmailpasswordLoading ? true : false,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                  autovalidateMode: autovalidateMode,
                  controller: emailController,
                  onSaved: (p0) {
                    email = p0!;
                  },
                  obscureText: false,
                  hintText: 'البريد الإلكتروني',
                  inputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),
                CusttomPasswordTextField(
                    onSaved: (p0) {
                      password = p0!;
                    },
                    autovalidateMode: autovalidateMode,
                    passwordController: passwordController),
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
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      BlocProvider.of<LoginEmailpasswordCubit>(context)
                          .loginWithEmailAndPassword(
                              userEntity: UserEntity(
                                  name: 'name',
                                  email: email,
                                  password: password));
                      emailController.clear();
                      passwordController.clear();
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  title: 'تسجيل دخول',
                  isLoading: state is LoginEmailpasswordLoading ? true : false,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
