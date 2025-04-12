import 'package:bloc/bloc.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/register_with_emailandpassword_usecase.dart';
part 'register_emailandpassword_state.dart';

class RegisterEmailandpasswordCubit
    extends Cubit<RegisterEmailandpasswordState> {
  RegisterEmailandpasswordCubit(this.registerWithEmailandpasswordUsecase)
      : super(RegisterEmailandpasswordInitial());
  final RegisterWithEmailandpasswordUsecase registerWithEmailandpasswordUsecase;

  Future<void> registerWithEmailAndPassword(
      {required UserEntity userEntity}) async {
    emit(RegisterEmailandpasswordLoading());
    var results =
        await registerWithEmailandpasswordUsecase.call(userEntity: userEntity);
    results.fold((fail) {
      emit(RegisterEmailandpasswordFailure(errorMessage: fail.errorMessage));
    }, (success) {
      emit(RegisterEmailandpasswordSuccess());
    });
  }
}
