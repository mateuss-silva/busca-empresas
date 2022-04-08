import 'package:dio/dio.dart';
import 'package:empresas_flutter/app/modules/home/irepositories/ienterprise_repository.dart';
import 'package:empresas_flutter/app/shared/exceptions/generic_exception.dart';
import 'package:empresas_flutter/app/shared/models/enterprise_model.dart';
import 'package:empresas_flutter/app/shared/repositories/base_api.dart';
import 'package:empresas_flutter/app/shared/utils/status_code_helper.dart';

class EnterpriseRepository extends BaseApi implements IEnterpriseRepository {
  EnterpriseRepository(Dio dio) : super(dio);

  @override
  Future<List<EnterpriseModel>> getCompanies(
      {int? enterpriseTypeId, String? name}) async {
    try {
      var query = {};

      if (enterpriseTypeId != null) {
        query['enterprise_types'] = enterpriseTypeId;
      }

      if (name != null) query['name'] = name;

      Response response =
          await dio.get(BaseApi.enterprisesPath, queryParams: query);

      var enterprises = (response.data["enterprises"] as List)
          .map((e) => EnterpriseModel.fromJson(e))
          .toList();

      return enterprises;
    } on DioError catch (e) {
      if (StatusCodeHelper.isError(e.response?.statusCode)) {
        throw GenericException("Erro ao buscar empresas");
      }
      throw GenericException(
          "Algo de errado aconteceu, tente novamente mais tarde");
    } catch (e) {
      throw GenericException(
          "Algo de errado aconteceu, tente novamente mais tarde");
    }
  }

  @override
  Future<EnterpriseModel> getCompany(int id) async {
    try {
      Response response = await dio.get("${BaseApi.enterprisesPath}/$id");

      var enterprise = EnterpriseModel.fromJson(response.data["enterprise"]);

      return enterprise;
    } on DioError catch (e) {
      if (StatusCodeHelper.isError(e.response?.statusCode)) {
        throw GenericException("Erro ao obter empresa");
      }
      throw GenericException(
          "Algo de errado aconteceu, tente novamente mais tarde");
    } catch (e) {
      throw GenericException(
          "Algo de errado aconteceu, tente novamente mais tarde");
    }
  }
}
