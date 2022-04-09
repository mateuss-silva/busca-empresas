import 'package:empresas_flutter/app/modules/home/blocs/enterprise_description/enterprise_description_bloc.dart';
import 'package:empresas_flutter/app/shared/models/enterprise_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EnterpriseDescriptionController extends Disposable {
  final EnterpriseDescriptionBloc enterpriseDescriptionBloc;

  EnterpriseDescriptionController(this.enterpriseDescriptionBloc);

  init(EnterpriseModel enterprise) {
    enterpriseDescriptionBloc
        .add(EnterpriseDescriptionInitialEvent(enterprise));

    enterpriseDescriptionBloc.add(const EnterpriseDescriptionFetchEvent());
  }

  @override
  void dispose() {
    enterpriseDescriptionBloc.close();
  }
}
