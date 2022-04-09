import 'package:empresas_flutter/app/modules/auth/submodules/login/blocs/login/login_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginController extends Disposable {
  final LoginBloc loginBloc;

  LoginController(this.loginBloc);

  Stream<LoginState> get loginStream => loginBloc.stream;

  onChangeEmail(email) => loginBloc.add(OnChangeEmailEvent(email: email));

  onChangePassword(password) =>
      loginBloc.add(OnChangePasswordEvent(password: password));

  onSubmit() => loginBloc.add(const OnSubmitEvent());

  @override
  void dispose() {
    loginBloc.close();
  }
}
