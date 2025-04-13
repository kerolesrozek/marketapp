abstract class CartState {}

class AddCartInitial extends CartState {}

class AddCartSuccess extends CartState {}

class AddCartFailure extends CartState {
  final String errorMesage;
  AddCartFailure(this.errorMesage);
}
