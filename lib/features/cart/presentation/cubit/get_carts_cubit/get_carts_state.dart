part of 'get_carts_cubit.dart';

@immutable
sealed class GetCartsState {}

final class GetCartsInitial extends GetCartsState {}

final class GetCartsSuccess extends GetCartsState {
  final List<CartEntity> carts;

  GetCartsSuccess({required this.carts});
}

final class GetCartsFailure extends GetCartsState {
  final String errorMessage;

  GetCartsFailure({required this.errorMessage});
}
