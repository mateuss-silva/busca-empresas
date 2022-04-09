part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {
  final LoginViewModel login;
  const LoginState(this.login);

  @override
  List<Object> get props => [login];
}

class LoginInitialState extends LoginState {
  const LoginInitialState() : super(const LoginViewModel());

  @override
  List<Object> get props => [login];
}

class LoginIdleState extends LoginState {
  const LoginIdleState({required LoginViewModel login}) : super(login);

  @override
  List<Object> get props => [login];
}

class LoginLoadingState extends LoginState {
  const LoginLoadingState({required LoginViewModel login}) : super(login);
  @override
  List<Object> get props => [];
}

class LoginSuccessState extends LoginState {
  final InvestorModel investor;

  const LoginSuccessState(
      {required this.investor, required LoginViewModel login})
      : super(login);

  @override
  List<Object> get props => [investor, login];
}

class LoginErrorState extends LoginState {
  final String message;

  const LoginErrorState({
    required this.message,
    required LoginViewModel login,
  }) : super(login);

  @override
  List<Object> get props => [message, login];
}
