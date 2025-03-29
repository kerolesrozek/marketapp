import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitesapp/features/auth/domain/entities/user_entity.dart';
import 'package:fruitesapp/features/auth/presentation/add_user_cubit/add_user_cubit.dart';
import 'package:fruitesapp/features/auth/presentation/register_emailpassword_cubit/register_emailandpassword_cubit.dart';
import 'package:fruitesapp/features/auth/presentation/views/widgets/cheak_box_widget.dart';
import 'package:fruitesapp/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:fruitesapp/features/on_boarding/presentayon/views/widgets/custom_button.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name;
  late String email;
  late String password;
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterEmailandpasswordCubit,
        RegisterEmailandpasswordState>(
      listener: (BuildContext context, RegisterEmailandpasswordState state) {
        if (state is RegisterEmailandpasswordSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Successs')));
        }
        if (state is RegisterEmailandpasswordFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is RegisterEmailandpasswordLoading ? true : false,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                  obscureText: false,
                  autovalidateMode: autovalidateMode,
                  controller: nameController,
                  onSaved: (p0) {
                    name = p0!;
                  },
                  hintText: 'الاسم كامل',
                  inputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  obscureText: false,
                  autovalidateMode: autovalidateMode,
                  controller: emailController,
                  onSaved: (p0) {
                    email = p0!;
                  },
                  hintText: 'البريد الإلكتروني',
                  // inputType: TextInputType.visiblePassword,
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  obscureText: true,

                  autovalidateMode: autovalidateMode,
                  controller: passwordController,
                  onSaved: (p0) {
                    password = p0!;
                  },
                  hintText: 'كلمة المرور',
                  // inputType: TextInputType.visiblePassword,
                  iconButton: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.visibility),
                  ),
                ),
                SizedBox(height: 20),
                CheckBoxWidget(),
                SizedBox(height: 20),
                CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      BlocProvider.of<RegisterEmailandpasswordCubit>(context)
                          .registerWithEmailAndPassword(
                              userEntity: UserEntity(
                                  name: name,
                                  email: email,
                                  password: password));
                      BlocProvider.of<AddUserCubit>(context).addUser(
                          userEntity: UserEntity(
                              name: name, email: email, password: password));
                      nameController.clear();
                      emailController.clear();
                      passwordController.clear();
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  title: 'تسجيل دخول',
                  isLoading:
                      state is RegisterEmailandpasswordLoading ? true : false,
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}
