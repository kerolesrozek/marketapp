import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruitesapp/features/products/domain/entities/product_entity.dart';
import '../../../auth/domain/entities/user_entity.dart';

abstract class HomeRemoteDataSource {
  Future<UserEntity> getUserData({required String uid});
  Future<List<ProductEntity>> getFeaturedProducts();
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

  @override
  Future<List<ProductEntity>> getFeaturedProducts() async {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');
    List<ProductEntity> featuredProducts = [];
    QuerySnapshot querySnapshot =
        await products.where('isFeaturedItem', isEqualTo: true).get();
    querySnapshot.docs.forEach((element) {
      featuredProducts.add(ProductEntity(
        reviews: element['reviews'],
        expirationMonth: element['expirationMonth'],
        isOrganic: element['isOrganic'],
        unitAmount: element['unitAmount'],
        numOfCalaories: element['numOfCalaories'],
        name: element['name'],
        description: element['description'],
        code: element['code'],
        price: element['price'],
        isFeaturedItem: element['isFeaturedItem'],
        imagePath: element['image'],
        averageRating: element['averageRating'],
        ratingCount: element['ratingCount'],
      ));
    });
    return featuredProducts;
  }
}
