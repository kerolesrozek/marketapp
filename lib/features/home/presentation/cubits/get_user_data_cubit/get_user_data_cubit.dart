import 'package:bloc/bloc.dart';
import 'package:fruitesapp/features/auth/domain/entities/user_entity.dart';
import 'package:fruitesapp/features/home/domain/usecases/get_user_data_usecase.dart';
import 'package:meta/meta.dart';

part 'get_user_data_state.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  GetUserDataCubit(this.getUserDataUsecase) : super(GetUserDataInitial());
  final GetUserDataUsecase getUserDataUsecase;

  Future<void> getUserData({required String uid}) async {
    emit(GetUserDataLoading());
    var result = await getUserDataUsecase.call(uid: uid);

    result.fold((fail) {
      emit(GetUserDataFailure(errorMessage: fail.errorMessage));
    }, (sucess) {
      emit(GetUserDataSuccess(userEntity: sucess));
    });
  }
}
