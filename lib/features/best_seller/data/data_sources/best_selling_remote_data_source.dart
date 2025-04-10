import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruitesapp/features/products/domain/entities/product_entity.dart';

abstract class BestSellingRemoteDataSource {
  Future<List<ProductEntity>> getBestSellingProducts();
}

class BestSellingRemoteDataSourceImpl implements BestSellingRemoteDataSource {
  @override
  Future<List<ProductEntity>> getBestSellingProducts() async {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');
    QuerySnapshot querySnapshot = await products
        .orderBy('sellingCount', descending: true)
        .limit(10)
        .get();
    List<QueryDocumentSnapshot> docs = querySnapshot.docs;

    List<ProductEntity> bestsellingList = [];
    for (var element in docs) {
      bestsellingList.add(
        ProductEntity(
          reviews: element['reviews'] != null ? element['reviews'] : [],
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
          ratingCount: element['ratingCount'],
        ),
      );
    }
    return bestsellingList;
  }
}
