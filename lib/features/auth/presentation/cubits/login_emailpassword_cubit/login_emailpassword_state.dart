part of 'login_emailpassword_cubit.dart';

@immutable
sealed class LoginEmailpasswordState {}

final class LoginEmailpasswordInitial extends LoginEmailpasswordState {}
final class LoginEmailpasswordLoading extends LoginEmailpasswordState {}
final class LoginEmailpasswordSuccess extends LoginEmailpasswordState {}
final class LoginEmailpasswordFailure extends LoginEmailpasswordState {
  final String errorMessage;

  LoginEmailpasswordFailure({required this.errorMessage});
}
