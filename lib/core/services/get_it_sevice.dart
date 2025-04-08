import 'package:fruitesapp/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:fruitesapp/features/auth/data/repos_imple/auth_repos_imple.dart';
import 'package:fruitesapp/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:fruitesapp/features/home/data/repos_imple/home_repos_imple.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AuthReposImple>(AuthReposImple(authRemoteDataSource: AuthRemoteDataSourceImpl()));
  getIt.registerSingleton<HomeReposImple>(HomeReposImple(homeRemoteDataSource: HomeRemoteDataSourceImpl()));


}