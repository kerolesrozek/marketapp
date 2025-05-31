import 'package:flutter_bloc/flutter_bloc.dart';
import 'check_out_state.dart';

class Check_outCubit extends Cubit<Check_outState> {
  Check_outCubit() : super(Check_outInitial());

  Future<void> doSomething() async {
    emit(Check_outLoading());
    try {
      // Call usecase
      // emit(Check_outSuccess(result));
    } catch (e) {
      emit(Check_outFailure(e.toString()));
    }
  }
}
