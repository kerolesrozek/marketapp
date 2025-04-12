import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/get_it_sevice.dart';
import '../../data/repos_imple/auth_repos_imple.dart';
import '../../domain/usecases/register_with_emailandpassword_usecase.dart';
import '../cubits/register_emailpassword_cubit/register_emailandpassword_cubit.dart';
import 'widgets/register_view_body_builder.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterEmailandpasswordCubit(
        RegisterWithEmailandpasswordUsecase(
            authRepos: getIt.get<AuthReposImple>()),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            ' حساب جديد',
            style: GoogleFonts.cairo(fontSize: 19, fontWeight: FontWeight.w700),
          ),
          leading: const Icon(Icons.arrow_back_ios_new),
          centerTitle: true,
          toolbarHeight: 80,
        ),
        body: RegisterViewBodyBuilder(),
      ),
    );
  }
}
