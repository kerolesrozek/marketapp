part of 'login_emailpassword_cubit.dart';

@immutable
sealed class LoginEmailpasswordState {}

final class LoginInitial extends LoginEmailpasswordState {}

final class LoginLoading extends LoginEmailpasswordState {}

final class LoginSuccess extends LoginEmailpasswordState {}

final class LoginFailure extends LoginEmailpasswordState {
  final String errorMessage;

  LoginFailure({required this.errorMessage});
}
