import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  Future<void> doSomething() async {
    emit(CartLoading());
    try {
      // Call usecase
      // emit(CartSuccess(result));
    } catch (e) {
      emit(CartFailure(e.toString()));
    }
  }
}
