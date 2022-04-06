import 'package:empresas_flutter/app/shared/models/enterprise_model.dart';

abstract class IEnterpriseRepository {
  Future<EnterpriseModel> getCompany(int id);

  Future<List<EnterpriseModel>> getCompanies(
      {int? enterpriseTypeId, String? name});
}
