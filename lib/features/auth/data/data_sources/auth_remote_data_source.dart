import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruitesapp/features/auth/domain/entities/user_entity.dart';

abstract class AuthRemoteDataSource {
  Future<void> registerWithEmailAndPassword({required UserEntity userEntity});
  Future<void> addUser({required UserEntity userEntity});
  Future<void> loginWithEmailAndPassword({required UserEntity userEntity});
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

  @override
  Future<void> addUser({required UserEntity userEntity}) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return users.add({
      'name': userEntity.name,
      'email': userEntity.email,
    });
  }

  @override
  Future<void> loginWithEmailAndPassword(
      {required UserEntity userEntity}) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: userEntity.email,
      password: userEntity.password,
    );
  }
}
