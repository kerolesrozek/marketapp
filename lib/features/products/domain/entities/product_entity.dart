import 'dart:io';

import 'package:fruitesapp/features/products/domain/entities/review_entity.dart';


class ProductEntity {
  final String name;
  final String description;
  final String code;
  final num price;
  final bool isFeaturedItem;
 final String imagePath;

  final int expirationMonth;
  final bool isOrganic;
  final int unitAmount;
  final int numOfCalaories;
  final num averageRating;
  final num ratingCount;
  final  List<dynamic> reviews;

  ProductEntity(
      {
     required this.reviews,
    this.averageRating = 0,
    this.ratingCount = 0,
    required this.expirationMonth,
    required this.isOrganic,
    required this.unitAmount,
    required this.numOfCalaories,
    required this.name,
    required this.description,
    required this.code,
    required this.price,
    required this.isFeaturedItem,
  required  this.imagePath,
  });
}
