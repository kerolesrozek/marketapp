import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitesapp/features/auth/presentation/cubits/register_emailpassword_cubit/register_emailandpassword_cubit.dart';
import 'package:fruitesapp/features/auth/presentation/views/widgets/register_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterViewBodyBuilder extends StatelessWidget {
  const RegisterViewBodyBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterEmailandpasswordCubit,
        RegisterEmailandpasswordState>(
      listener: (context, state) {
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
        return ModalProgressHUD(
            inAsyncCall:
                state is RegisterEmailandpasswordLoading ? true : false,
            child: RegisterViewBody(
              isLoading:
                  state is RegisterEmailandpasswordLoading ? true : false,
            ));
      },
    );
  }
}
