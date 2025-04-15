import 'package:bloc/bloc.dart';
import 'package:fruitesapp/features/home/domain/usecases/get_featured_products_usecase.dart';
import 'package:fruitesapp/features/products/domain/entities/product_entity.dart';
import 'package:meta/meta.dart';

part 'get_featured_products_state.dart';

class GetFeaturedProductsCubit extends Cubit<GetFeaturedProductsState> {
  GetFeaturedProductsCubit(this.getFeaturedProductsUsecase)
      : super(GetFeaturedProductsInitial());
  final GetFeaturedProductsUsecase getFeaturedProductsUsecase;

  Future<void> getFeaturedProducts() async {
    emit(GetFeaturedProductsLoading());

    var result = await getFeaturedProductsUsecase.call();

    result.fold((fail) {
      emit(GetFeaturedProductsFailure(errorMessage: fail.errorMessage));
    }, (sucess) {
      emit(GetFeaturedProductsSuccess(featuredProducts: sucess));
    });
  }
}
