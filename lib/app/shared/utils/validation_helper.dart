import 'package:email_validator/email_validator.dart';

class ValidationHelper {
  static String? email(String? email) {
    if (!EmailValidator.validate(email ?? "")) {
      return 'Informe um email válido.';
    }
    return null;
  }

  static String? password(String? password) {
    return required(password, message: 'Informe uma senha.');
  }

  static String? required(
    String? value, {
    String message = "Campo obrigatório.",
  }) {
    if ((value ?? "").isEmpty) {
      return message;
    }
    return null;
  }
}
