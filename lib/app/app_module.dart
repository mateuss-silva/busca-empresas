import 'package:empresas_flutter/app/modules/auth/auth_module.dart';
import 'package:empresas_flutter/app/modules/auth/repositories/auth_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: AuthModule()),
  ];
}
