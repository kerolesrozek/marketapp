abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsSuccess extends ProductsState {
  // final result;
  // Success(this.result);
}

class ProductsFailure extends ProductsState {
  final String error;
  ProductsFailure(this.error);
}
