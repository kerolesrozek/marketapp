import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitesapp/features/auth/domain/entities/user_entity.dart';
import 'package:fruitesapp/features/auth/domain/usecases/add_user_usecase.dart';

part 'add_user_state.dart';

class AddUserCubit extends Cubit<AddUserState> {
  AddUserCubit(this.addUserUsecase) : super(AddUserInitial());
  final AddUserUsecase addUserUsecase;

  Future<void> addUser({required UserEntity userEntity}) async {
    emit(AddUserLoading());
    var result = await addUserUsecase.call(userEntity: userEntity);
    result.fold((fail) {
      emit(AddUserFailure(errorMessage: fail.errorMessage));
    }, (succes) {
      emit(AddUserSuccess());
    });
  }
}
