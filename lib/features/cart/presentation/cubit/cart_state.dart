abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartSuccess extends CartState {
  // final result;
  // Success(this.result);
}

class CartFailure extends CartState {
  final String error;
  CartFailure(this.error);
}
