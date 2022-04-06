import 'package:empresas_flutter/app/modules/home/irepositories/ienterprise_repository.dart';
import 'package:empresas_flutter/app/shared/models/enterprise_model.dart';

class EnterpriseRepository implements IEnterpriseRepository {
  @override
  Future<List<EnterpriseModel>> getCompanies({int? enterpriseTypeId, String? name}) {
    // TODO: implement getCompanies
    throw UnimplementedError();
  }

  @override
  Future<EnterpriseModel> getCompany(int id) {
    // TODO: implement getCompany
    throw UnimplementedError();
  }

}