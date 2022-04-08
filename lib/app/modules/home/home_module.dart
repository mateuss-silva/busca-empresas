import 'package:dio/dio.dart';
import 'package:empresas_flutter/app/modules/home/blocs/home/home_bloc.dart';
import 'package:empresas_flutter/app/modules/home/controllers/enterprise_description_controller.dart';
import 'package:empresas_flutter/app/modules/home/home_controller.dart';
import 'package:empresas_flutter/app/modules/home/pages/enterprise_description_page.dart';
import 'package:empresas_flutter/app/modules/home/repositories/enterprise_repository.dart';
import 'package:empresas_flutter/app/shared/repositories/base_api.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => EnterpriseRepository(i.get<BaseApi>())),
    Bind.factory((i) => EnterpriseDescriptionController()),
    Bind.lazySingleton((i) => HomeBloc(i.get<EnterpriseRepository>())),
    Bind.lazySingleton((i) => HomeController(
          i.get<EnterpriseRepository>(),
          i.get<HomeBloc>(),
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (context, args) => HomePage(investor: args.data)),
    ChildRoute('/enterprise-description/:id',
        child: (context, args) => const EnterpriseDescriptionPage()),
  ];
}
