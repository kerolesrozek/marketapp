part of 'get_best_selling_products_cubit.dart';

@immutable
sealed class GetBestSellingProductsState {}

final class GetBestSellingProductsInitial extends GetBestSellingProductsState {}

final class GetBestSellingProductsLoading extends GetBestSellingProductsState {}

final class GetBestSellingProductsSuccess extends GetBestSellingProductsState {
  final List<ProductEntity> bestSellingProducts;

  GetBestSellingProductsSuccess({required this.bestSellingProducts});
}

final class GetBestSellingProductsFailure extends GetBestSellingProductsState {
  final String errorMessage;

  GetBestSellingProductsFailure({required this.errorMessage});
}
