import 'package:empresas_flutter/app/shared/models/enterprise_type_model.dart';

class EnterpriseModel {
  int id;
  String name;
  String? description;
  String? email;
  String? facebook;
  String? twitter;
  String? linkedin;
  String? phone;
  bool? ownEnterprise;
  String? photo;
  int? value;
  int? shares;
  double? sharePrice;
  int? ownShares;
  String? city;
  String? country;
  EnterpriseTypeModel? enterpriseType;

  EnterpriseModel({
    required this.id,
    required this.name,
    this.description,
    this.email,
    this.facebook,
    this.twitter,
    this.linkedin,
    this.phone,
    this.ownEnterprise,
    this.photo,
    this.value,
    this.shares,
    this.sharePrice,
    this.ownShares,
    this.city,
    this.country,
    this.enterpriseType,
  });

  factory EnterpriseModel.fromJson(Map<String, dynamic> json) {
    return EnterpriseModel(
      id: json['id'],
      name: json['enterprise_name'],
      description: json['description'],
      email: json['email_enterprise'],
      facebook: json['facebook'],
      twitter: json['twitter'],
      linkedin: json['linkedin'],
      phone: json['phone'],
      ownEnterprise: json['own_enterprise'],
      photo: json['photo'],
      value: json['value'],
      shares: json['shares'],
      sharePrice: json['share_price'],
      ownShares: json['own_shares'],
      city: json['city'],
      country: json['country'],
      enterpriseType: json['enterprise_type'] != null
          ? EnterpriseTypeModel.fromJson(json['enterprise_type'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['enterprise_name'] = name;
    data['description'] = description;
    data['email_enterprise'] = email;
    data['facebook'] = facebook;
    data['twitter'] = twitter;
    data['linkedin'] = linkedin;
    data['phone'] = phone;
    data['own_enterprise'] = ownEnterprise;
    data['photo'] = photo;
    data['value'] = value;
    data['shares'] = shares;
    data['share_price'] = sharePrice;
    data['own_shares'] = ownShares;
    data['city'] = city;
    data['country'] = country;
    if (enterpriseType != null) {
      data['enterprise_type'] = enterpriseType!.toJson();
    }
    return data;
  }
}
