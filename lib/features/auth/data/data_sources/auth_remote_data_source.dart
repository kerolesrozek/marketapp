import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import '../../domain/entities/user_entity.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthRemoteDataSource {
  Future<UserCredential> registerWithEmailAndPassword(
      {required UserEntity userEntity});
  Future<void> addUser({required UserEntity userEntity});
  Future<void> loginWithEmailAndPassword({required UserEntity userEntity});
  Future<UserCredential> loginWithGoogle();
  Future<UserCredential> loginWithFacebook();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserCredential> registerWithEmailAndPassword(
      {required UserEntity userEntity}) async {
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: userEntity.email,
      password: userEntity.password!,
    );
    // await addUser(userEntity: userEntity);
  }

  @override
  Future<void> addUser(
      {required UserEntity userEntity}) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    log(userEntity.userId.toString());
    return users.doc(FirebaseAuth.instance.currentUser!.uid).set({
      'name': userEntity.name,
      'email': userEntity.email,
      'userId': FirebaseAuth.instance.currentUser!.uid
    });
  }

  @override
  Future<void> loginWithEmailAndPassword(
      {required UserEntity userEntity}) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: userEntity.email,
      password: userEntity.password!,
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

  @override
  Future<UserCredential> loginWithFacebook() async {
    await FacebookAuth.instance.logOut();
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
  }
}
