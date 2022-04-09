import 'package:equatable/equatable.dart';

class LoginViewModel extends Equatable {
  final String email;
  final String password;

  const LoginViewModel({this.email = '', this.password = ''});

  LoginViewModel copyWith({String? email, String? password}) {
    return LoginViewModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };

  @override
  List<Object> get props => [email, password];

  @override
  String toString() => 'LoginViewModel { email: $email, password: $password }';
}
