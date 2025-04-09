import 'package:flutter_bloc/flutter_bloc.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  Future<void> doSomething() async {
    emit(ProductsLoading());
    try {
      // Call usecase
      // emit(ProductsSuccess(result));
    } catch (e) {
      emit(ProductsFailure(e.toString()));
    }
  }
}
