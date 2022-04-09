part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class OnChangeEmailEvent extends LoginEvent {
  final String email;

  const OnChangeEmailEvent({required this.email}) : super();

  @override
  List<Object> get props => [email];
}

class OnChangePasswordEvent extends LoginEvent {
  final String password;

  const OnChangePasswordEvent({required this.password}) : super();

  @override
  List<Object> get props => [password];
}

class OnSubmitEvent extends LoginEvent {
  const OnSubmitEvent() : super();

  @override
  List<Object> get props => [];
}
