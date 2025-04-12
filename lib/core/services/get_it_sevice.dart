import '../../features/auth/data/data_sources/auth_remote_data_source.dart';
import '../../features/auth/data/repos_imple/auth_repos_imple.dart';
import '../../features/products/data/data_sources/products_remote_data_source.dart';
import '../../features/products/data/repos_imple/products_repos_imple.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AuthReposImple>(
      AuthReposImple(authRemoteDataSource: AuthRemoteDataSourceImpl()));
  getIt.registerSingleton<ProductsReposImple>(ProductsReposImple(
      productsRemoteDataSource: ProductsRemoteDataSourceImpl()));
}
