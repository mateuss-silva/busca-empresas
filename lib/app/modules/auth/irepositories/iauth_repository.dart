import 'package:dio/src/dio.dart';
import 'package:empresas_flutter/app/shared/models/investor_model.dart';
import 'package:empresas_flutter/app/shared/repositories/base_api.dart';
import 'package:empresas_flutter/app/shared/view_models/login_view_model.dart';

abstract class IAuthRepository extends BaseApi{
  IAuthRepository(Dio dio) : super(dio);

  Future<InvestorModel> login(LoginViewModel login);
}