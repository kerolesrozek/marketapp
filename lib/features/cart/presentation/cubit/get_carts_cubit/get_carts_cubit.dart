import 'package:bloc/bloc.dart';
import 'package:fruitesapp/features/cart/domain/entities/cart_entity.dart';
import 'package:fruitesapp/features/cart/domain/usecases/get_carts_usecase.dart';
import 'package:meta/meta.dart';

part 'get_carts_state.dart';

class GetCartsCubit extends Cubit<GetCartsState> {
  GetCartsCubit(this.getCartsUsecase) : super(GetCartsInitial());
  final GetCartsUsecase getCartsUsecase;

  getCarts() {
    var results = getCartsUsecase.call();
    results.fold((failure) {
      emit(GetCartsFailure(errorMessage: failure.errorMessage));
    }, (success) {
      emit(GetCartsSuccess(carts: success));
    });
  }
}
