import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruitesapp/features/auth/domain/entities/user_entity.dart';

abstract class AuthRemoteDataSource {
  Future<void> registerWithEmailAndPassword({required UserEntity userEntity});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<void> registerWithEmailAndPassword(
      {required UserEntity userEntity}) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: userEntity.email,
      password: userEntity.password,
    );
  }
}
