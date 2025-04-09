import 'package:bloc/bloc.dart';
import 'package:fruitesapp/features/best_seller/domain/usecases/get_best_selling_products_usecase.dart';
import 'package:fruitesapp/features/home/domain/entities/product_entity.dart';
import 'package:meta/meta.dart';

part 'get_best_selling_products_state.dart';

class GetBestSellingProductsCubit extends Cubit<GetBestSellingProductsState> {
  GetBestSellingProductsCubit(this.getBestSellingProductsUsecase)
      : super(GetBestSellingProductsInitial());
  final GetBestSellingProductsUsecase getBestSellingProductsUsecase;

  Future<void> getBestSellingProducts() async {
    emit(GetBestSellingProductsLoading());
    final result = await getBestSellingProductsUsecase.call();
    result.fold(
        (l) =>
            emit(GetBestSellingProductsFailure(errorMessage: l.errorMessage)),
        (r) => emit(GetBestSellingProductsSuccess(bestSellingProducts: r)));
  }
}
