part of 'delete_cart_cubit.dart';

@immutable
sealed class DeleteCartState {}

final class DeleteCartInitial extends DeleteCartState {}

final class DeleteCartSuccess extends DeleteCartState {}

final class DeleteCartfailure extends DeleteCartState {
  final String errorMessage;

  DeleteCartfailure({required this.errorMessage});
}

