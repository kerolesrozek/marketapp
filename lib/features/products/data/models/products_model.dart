import '../../domain/entities/products_entity.dart';

class ProductsModel extends ProductsEntity {
  ProductsModel() : super();

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    // TODO: Map JSON to model
    return ProductsModel();
  }
}
