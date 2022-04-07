import 'package:empresas_flutter/app/shared/models/enterprise_model.dart';

class PortfolioModel {
  int? enterprisesNumber;
  List<EnterpriseModel>? enterprises;

  PortfolioModel({this.enterprisesNumber, this.enterprises});

  factory PortfolioModel.fromJson(Map<String, dynamic> json) {
    return PortfolioModel(
      enterprisesNumber: json['enterprises_number'],
      enterprises: json['enterprises'] != null
          ? (json['enterprises'] as List)
              .map((i) => EnterpriseModel.fromJson(i))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['enterprises_number'] = enterprisesNumber;
    if (enterprises != null) {
      data['enterprises'] = enterprises!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
