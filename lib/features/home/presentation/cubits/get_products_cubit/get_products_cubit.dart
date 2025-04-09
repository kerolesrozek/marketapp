import 'package:bloc/bloc.dart';
import 'package:fruitesapp/features/home/domain/entities/product_entity.dart';
import 'package:fruitesapp/features/home/domain/usecases/get_products_usecase.dart';
import 'package:meta/meta.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit(this.getProductsUsecase) : super(GetProductsInitial());
  final GetProductsUsecase getProductsUsecase;

  Future<void> getProducts() async {
    emit(GetProductsLoading());
    var result = await getProductsUsecase.call();

    result.fold((fail) {
      emit(GetProductsFailure(errorMessage: fail.errorMessage));
    }, (success) {
      emit(GetProductsSuccess(productsList: success));
    });
  }
}
