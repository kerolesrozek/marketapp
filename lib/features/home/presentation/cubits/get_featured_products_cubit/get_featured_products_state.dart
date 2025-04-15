part of 'get_featured_products_cubit.dart';

@immutable
sealed class GetFeaturedProductsState {}

final class GetFeaturedProductsInitial extends GetFeaturedProductsState {}

final class GetFeaturedProductsLoading extends GetFeaturedProductsState {}

final class GetFeaturedProductsSuccess extends GetFeaturedProductsState {
  final List<ProductEntity> featuredProducts;

  GetFeaturedProductsSuccess({required this.featuredProducts});
}

final class GetFeaturedProductsFailure extends GetFeaturedProductsState {
  final String errorMessage;

  GetFeaturedProductsFailure({required this.errorMessage});
}
