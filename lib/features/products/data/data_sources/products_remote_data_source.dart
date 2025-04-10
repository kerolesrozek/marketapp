import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruitesapp/features/auth/domain/entities/user_entity.dart';
import 'package:fruitesapp/features/products/domain/entities/product_entity.dart';
import 'package:fruitesapp/features/products/domain/entities/review_entity.dart';

abstract class ProductsRemoteDataSource {
  Future<List<ProductEntity>> getProducts();
}

class ProductsRemoteDataSourceImpl extends ProductsRemoteDataSource {
 
  @override
  Future<List<ProductEntity>> getProducts() async {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');
    QuerySnapshot querySnapshot = await products.get();
    List<QueryDocumentSnapshot> docs = querySnapshot.docs;
    List<ProductEntity> productsList = [];
    for (var element in docs) {
      productsList.add(ProductEntity(
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
      ));
    }
    return productsList;
  }
}
