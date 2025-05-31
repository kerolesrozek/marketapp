abstract class Check_outState {}

class Check_outInitial extends Check_outState {}

class Check_outLoading extends Check_outState {}

class Check_outSuccess extends Check_outState {
  // final result;
  // Success(this.result);
}

class Check_outFailure extends Check_outState {
  final String error;
  Check_outFailure(this.error);
}
