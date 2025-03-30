
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitesapp/features/auth/presentation/cubits/login_emailpassword_cubit/login_emailpassword_cubit.dart';
import 'package:fruitesapp/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewBuilder extends StatelessWidget {
  const LoginViewBuilder({
    super.key,
  });

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
        return ModalProgressHUD(
            inAsyncCall: state is LoginEmailpasswordLoading ? true : false,
            child: LoginViewBody(
              isLoading: state is LoginEmailpasswordLoading ? true : false,
            ));
      },
    );
  }
}
