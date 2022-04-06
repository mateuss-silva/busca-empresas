import 'package:empresas_flutter/app/modules/home/controllers/enterprise_description_controller.dart';
import 'package:empresas_flutter/app/modules/home/home_controller.dart';
import 'package:empresas_flutter/app/modules/home/pages/enterprise_description_page.dart';
import 'package:empresas_flutter/app/modules/home/repositories/enterprise_repository.dart';
import 'package:empresas_flutter/app/modules/home/bloc/home_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => EnterpriseRepository()),
    Bind.factory((i) => EnterpriseDescriptionController()),
    Bind.lazySingleton((i) => HomeController()),
    Bind.lazySingleton((i) => HomeBloc()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (context, args) => const HomePage()),
    ChildRoute('/enterprise-description/:id',
        child: (context, args) => const EnterpriseDescriptionPage()),
  ];
}
