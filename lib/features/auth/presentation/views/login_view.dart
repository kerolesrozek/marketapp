import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitesapp/core/services/get_it_sevice.dart';
import 'package:fruitesapp/features/auth/data/repos_imple/auth_repos_imple.dart';
import 'package:fruitesapp/features/auth/domain/usecases/login_with_emailpassword_usecase.dart';
import 'package:fruitesapp/features/auth/presentation/cubits/login_emailpassword_cubit/login_emailpassword_cubit.dart';
import 'package:fruitesapp/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:fruitesapp/features/auth/presentation/views/widgets/login_view_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginEmailpasswordCubit(
          LoginWithEmailpasswordUsecase(
              authRepos: getIt.get<AuthReposImple>())),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'تسجيل دخول',
            style: GoogleFonts.cairo(fontSize: 19, fontWeight: FontWeight.w700),
          ),
          leading: const Icon(Icons.arrow_back_ios_new),
          centerTitle: true,
          toolbarHeight: 80,
        ),
        body: SafeArea(child: LoginViewBuilder()),
      ),
    );
  }
}
