import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitesapp/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:fruitesapp/features/auth/data/repos_imple/auth_repos_imple.dart';
import 'package:fruitesapp/features/auth/domain/usecases/add_user_usecase.dart';
import 'package:fruitesapp/features/auth/domain/usecases/register_with_emailandpassword_usecase.dart';
import 'package:fruitesapp/features/auth/presentation/add_user_cubit/add_user_cubit.dart';
import 'package:fruitesapp/features/auth/presentation/register_emailpassword_cubit/register_emailandpassword_cubit.dart';

import 'package:fruitesapp/features/auth/presentation/views/widgets/have_account_widget.dart';
import 'package:fruitesapp/features/auth/presentation/views/widgets/register_form.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => RegisterEmailandpasswordCubit(
                      RegisterWithEmailandpasswordUsecase(
                          authRepos: AuthReposImple(
                              authRemoteDataSource:
                                  AuthRemoteDataSourceImpl()))),
                ),
                BlocProvider(
                  create: (context) => AddUserCubit(AddUserUsecase(
                      authRepos: AuthReposImple(
                          authRemoteDataSource: AuthRemoteDataSourceImpl()))),
                ),
              ],
              child: RegisterForm(),
            ),
            HaveAccountWidget(),
          ],
        ),
      ),
    );
  }
}
