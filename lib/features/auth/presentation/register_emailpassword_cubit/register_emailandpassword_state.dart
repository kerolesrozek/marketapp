part of 'register_emailandpassword_cubit.dart';


sealed class RegisterEmailandpasswordState {}

final class RegisterEmailandpasswordInitial extends RegisterEmailandpasswordState {}

final class RegisterEmailandpasswordLoading extends RegisterEmailandpasswordState {}

final class RegisterEmailandpasswordSuccess extends RegisterEmailandpasswordState {}

final class RegisterEmailandpasswordFailure extends RegisterEmailandpasswordState {
  final String errorMessage;

  RegisterEmailandpasswordFailure({required this.errorMessage});
}
