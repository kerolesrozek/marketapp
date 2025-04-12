import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../auth/domain/entities/user_entity.dart';

abstract class HomeRemoteDataSource {
  Future<UserEntity> getUserData({required String uid});
}

class HomeRemoteDataSourceImple implements HomeRemoteDataSource {
   @override
  Future<UserEntity> getUserData({required String uid}) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    DocumentSnapshot documentSnapshot = await users.doc(uid).get();

    return UserEntity(
      name: documentSnapshot['name'],
      email: documentSnapshot['email'],
    );
  }

}
