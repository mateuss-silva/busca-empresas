import 'package:flutter_test/flutter_test.dart';
import 'package:empresas_flutter/app/modules/auth/auth_module.dart';
import 'package:modular_test/modular_test.dart';
 
void main() {

  setUpAll(() {
    initModule(AuthModule());
  });
}