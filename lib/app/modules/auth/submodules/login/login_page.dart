import 'package:empresas_flutter/app/modules/auth/submodules/login/blocs/login/login_bloc.dart';
import 'package:empresas_flutter/app/modules/auth/submodules/login/login/widgets/input_text_field_widget.dart';
import 'package:empresas_flutter/app/modules/auth/submodules/login/login/widgets/login_button_widget.dart';
import 'package:empresas_flutter/app/modules/auth/submodules/login/login/widgets/semi_circle_widget.dart';
import 'package:empresas_flutter/app/modules/auth/submodules/login/login_controller.dart';
import 'package:empresas_flutter/app/shared/utils/validation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  void initState() {
    super.initState();
    controller.loginStream.listen((state) {
      if (state is LoginLoadingState) {
        context.loaderOverlay.show();
      } else if (state is LoginSuccessState) {
        context.loaderOverlay.hide();
        Modular.to.navigate('/home', arguments: state.investor);
      } else if (state is LoginErrorState) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.message),
          backgroundColor: Theme.of(context).errorColor,
        ));
      } else {
        context.loaderOverlay.hide();
      }
    });
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            SemiCircleWidget(),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: InputTextFieldWidget(
                label: "Email",
                onChange: controller.onChangeEmail,
                validator: ValidationHelper.email,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: InputTextFieldWidget(
                obscureText: true,
                label: "Senha",
                keyboardType: TextInputType.visiblePassword,
                onChange: controller.onChangePassword,
                onSubmitted: (v) {
                  bool validForm = formKey.currentState!.validate();
                  if (validForm) controller.onSubmit();
                },
                validator: ValidationHelper.password,
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: LoginButtonWidget(
                onPressed: () {
                  bool validForm = formKey.currentState!.validate();
                  if (validForm) controller.onSubmit();
                },
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
