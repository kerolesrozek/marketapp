import 'package:bloc/bloc.dart';
import 'package:fruitesapp/features/cart/domain/entities/cart_entity.dart';
import 'package:fruitesapp/features/cart/domain/usecases/delete_cart_usecase.dart';
import 'package:meta/meta.dart';

part 'delete_cart_state.dart';

class DeleteCartCubit extends Cubit<DeleteCartState> {
  DeleteCartCubit(this.deleteCartUsecase) : super(DeleteCartInitial());
  final DeleteCartUsecase deleteCartUsecase;

  Future<void> deleteCart({required CartEntity cartEntity}) async {
    var results = deleteCartUsecase.call(cartEntity: cartEntity);
    results.fold((f) {
      emit(DeleteCartfailure(errorMessage: f.errorMessage));
    }, (r) {
      emit(DeleteCartSuccess());
    });
  }
}
