import 'package:empresas_flutter/app/shared/models/investor_model.dart';
import 'package:empresas_flutter/app/shared/repositories/base_api.dart';
import 'package:empresas_flutter/app/shared/view_models/login_view_model.dart';

abstract class IAuthRepository {
  final BaseApi api;

  IAuthRepository(this.api);

  Future<InvestorModel> login(LoginViewModel login);
}
