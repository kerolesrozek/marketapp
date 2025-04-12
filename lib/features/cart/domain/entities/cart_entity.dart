import '../../../products/domain/entities/product_entity.dart';

class CartEntity {
  final ProductEntity productEntity;
  int count;

  CartEntity({required this.productEntity, this.count = 0});

  num calcTotalPrice() => productEntity.price * count;
  num calcTotalweight() => productEntity.unitAmount * count;
}
