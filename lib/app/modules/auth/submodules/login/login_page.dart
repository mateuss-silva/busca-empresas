import 'package:empresas_flutter/app/modules/auth/submodules/login/login/widgets/input_text_field_widget.dart';
import 'package:empresas_flutter/app/modules/auth/submodules/login/login/widgets/login_button_widget.dart';
import 'package:empresas_flutter/app/modules/auth/submodules/login/login/widgets/semi_circle_widget.dart';
import 'package:empresas_flutter/app/modules/auth/submodules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SemiCircleWidget(),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: InputTextFieldWidget(
              label: "Email",
              onChange: (v) {
                //TODO: implementar
              },
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: InputTextFieldWidget(
              obscureText: true,
              label: "Senha",
              keyboardType: TextInputType.visiblePassword,
              onChange: (v) {
                //TODO: implementar
              },
              onSubmitted: (v) {
                //TODO: implementar
              },
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: LoginButtonWidget(
              onPressed: () {
                //TODO: implementar
              },
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
