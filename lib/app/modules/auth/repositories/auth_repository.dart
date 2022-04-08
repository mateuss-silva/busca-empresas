import 'package:dio/dio.dart';
import 'package:empresas_flutter/app/modules/auth/irepositories/iauth_repository.dart';
import 'package:empresas_flutter/app/shared/exceptions/generic_exception.dart';
import 'package:empresas_flutter/app/shared/models/authorization_model.dart';
import 'package:empresas_flutter/app/shared/repositories/base_api.dart';
import 'package:empresas_flutter/app/shared/utils/status_code_helper.dart';
import 'package:empresas_flutter/app/shared/view_models/login_view_model.dart';
import 'package:empresas_flutter/app/shared/models/investor_model.dart';

class AuthRepository implements IAuthRepository {
  AuthRepository(this.api);

  @override
  final BaseApi api;

  @override
  Future<InvestorModel> login(LoginViewModel login) async {
    try {
      var body = login.toJson();

      Response response = await api.dio.post(BaseApi.signInPath, data: body);

      var authorization = AuthorizationModel.fromHeaders(response.headers);
      var investor = InvestorModel.fromJson(response.data["investor"]);

      investor.authorization = authorization;

      return investor;
    } on DioError catch (e) {
      if (StatusCodeHelper.isError(e.response?.statusCode)) {
        throw GenericException("Usuário e/ou senha inválidos.");
      }
      throw GenericException(
          "Erro ao tentar fazer login, tente novamente mais tarde.");
    } catch (e) {
      throw GenericException(
          "Erro ao tentar efetuar login, tente novamente mais tarde.");
    }
  }
}
