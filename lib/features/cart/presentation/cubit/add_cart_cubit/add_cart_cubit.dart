import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitesapp/features/cart/domain/entities/cart_entity.dart';
import 'package:fruitesapp/features/cart/domain/usecases/add_product_to_cart_usecase.dart';
import 'add_cart_state.dart';

class AddCartCubit extends Cubit<CartState> {
  AddCartCubit(this.addCartUseCase) : super(AddCartInitial());
  final AddCartUseCase addCartUseCase;

  void addToCart({required CartEntity cartEntity}) async {
    var results = addCartUseCase.call(cartEntity: cartEntity);
    results.fold((f) {
      emit(AddCartFailure(f.errorMessage));
    }, (r) {
      emit(AddCartSuccess());
    });
  }
}
