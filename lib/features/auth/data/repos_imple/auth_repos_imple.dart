import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/failures.dart';
import '../data_sources/auth_remote_data_source.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repos/auth_repos.dart';

class AuthReposImple extends AuthRepos {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthReposImple({required this.authRemoteDataSource});
  @override
  Future<Either<Failures, void>> registerWithEmailAndPassword(
      {required UserEntity userEntity}) async {
    try {
      return right(await authRemoteDataSource
          .registerWithEmailAndPassword(userEntity: userEntity)
          .then((value) => addUser(userEntity: userEntity)));
    } on FirebaseAuthException catch (e) {
      await FirebaseAuth.instance.currentUser?.delete();
      log('error in auth repos.registerWithEmailAndPassword ${e.toString()}');
      if (e.code == 'weak-password') {
        return left(Failures(errorMessage: ' كلمة المرور ضعيفة جدا'));
      } else if (e.code == 'email-already-in-use') {
        return left(
            Failures(errorMessage: 'هذا البريد الالكتروني مستخدم بالفعل'));
      } else {
        return left(Failures(errorMessage: e.code));
      }
    } catch (e) {
      await FirebaseAuth.instance.currentUser?.delete();

      log('error in auth repos.registerWithEmailAndPassword ${e.toString()}');
      return left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> addUser(
      {required UserEntity userEntity}) async {
    try {
      return right(await authRemoteDataSource.addUser(userEntity: userEntity));
    } catch (e) {
      log('error in auth repos.addUser ${e.toString()}');
      return left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> loginWithEmailAndPassword(
      {required UserEntity userEntity}) async {
    try {
      return right(await authRemoteDataSource.loginWithEmailAndPassword(
          userEntity: userEntity));
    } on FirebaseAuthException catch (e) {
      log('error in auth reposImple.loginWithEmailAndPassword ${e.toString()}');
      if (e.code == 'user-not-found') {
        return left(
            Failures(errorMessage: 'لا يوجد مستخدم بهذا البريد الالكتروني'));
      } else if (e.code == 'wrong-password') {
        return left(Failures(errorMessage: 'كلمة المرور غير صحيحة'));
      } else {
        return left(Failures(errorMessage: e.code));
      }
    } catch (e) {
      log('error in auth reposImple.loginWithEmailAndPassword ${e.toString()}');
      return left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> loginWithGoogle() async {
    try {
      return right(await authRemoteDataSource.loginWithGoogle().then((value) {
        addUser(
          userEntity: UserEntity(
              email: value.user!.email!,
              name: value.user!.displayName!,
              userId: value.user!.uid),
        );
      }));
    } catch (e) {
      FirebaseAuth.instance.currentUser!.delete();

      log('error in auth reposImple.loginWithGoogle ${e.toString()}');
      return left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> loginWithFacebook() async {
    try {
      return right(await authRemoteDataSource.loginWithFacebook().then((value) {
        addUser(
            userEntity: UserEntity(
                name: value.user!.displayName!,
                email: value.user!.email!,
                userId: value.user!.uid));
      }));
    } catch (e) {
      FirebaseAuth.instance.currentUser!.delete();
      log('error in auth reposImple.loginWithFacebook ${e.toString()}');
      return left(Failures(errorMessage: e.toString()));
    }
  }
}
