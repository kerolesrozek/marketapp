import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruitesapp/features/auth/domain/entities/user_entity.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthRemoteDataSource {
  Future<void> registerWithEmailAndPassword({required UserEntity userEntity});
  Future<void> addUser({required UserEntity userEntity});
  Future<void> loginWithEmailAndPassword({required UserEntity userEntity});
  Future<UserCredential> loginWithGoogle();
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

  @override
  Future<UserCredential> loginWithGoogle() async {
    await GoogleSignIn().signOut(); // إجبار تسجيل الخروج
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
