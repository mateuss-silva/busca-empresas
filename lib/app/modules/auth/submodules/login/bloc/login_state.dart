part of 'login_bloc.dart';

@immutable
abstract class LoginState {
  const LoginState();
}

class LoginIdleState extends LoginState {
  final String email;
  final String password;

  const LoginIdleState({
    this.email = '',
    this.password = '',
  }) : super();
}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginErrorState extends LoginState {
  final String message;

  const LoginErrorState({
    required this.message,
  }) : super();
}
