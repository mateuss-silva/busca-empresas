import 'package:dio/dio.dart';
import 'package:empresas_flutter/app/modules/auth/auth_module.dart';
import 'package:empresas_flutter/app/modules/home/home_module.dart';
import 'package:empresas_flutter/app/shared/repositories/base_api.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => Dio()),
    Bind.singleton((i) => BaseApi(i.get<Dio>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: AuthModule()),
    ModuleRoute('/home', module: HomeModule()),
  ];
}
