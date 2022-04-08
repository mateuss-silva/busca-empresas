import 'package:empresas_flutter/app/shared/models/authorization_model.dart';
import 'package:empresas_flutter/app/shared/models/enterprise_model.dart';
import 'package:empresas_flutter/app/shared/models/portfolio_model.dart';

class InvestorModel {
  final int id;
  final String? name;
  final String? email;
  final String? city;
  final String? country;
  final double? balance;
  final String? photo;
  final PortfolioModel? portfolio;
  final double? portfolioValue;
  final bool firstAccess;
  final bool superAngel;

  EnterpriseModel? enterprise;

  AuthorizationModel? authorization;

  InvestorModel({
    required this.id,
    this.name,
    this.email,
    this.city,
    this.country,
    this.balance,
    this.photo,
    this.portfolio,
    this.portfolioValue,
    this.firstAccess = false,
    this.superAngel = false,
  });

  factory InvestorModel.fromJson(Map<String, dynamic> json) {
    return InvestorModel(
      id: json['id'],
      name: json['investor_name'],
      email: json['email'],
      city: json['city'],
      country: json['country'],
      balance: json['balance'],
      photo: json['photo'],
      portfolioValue: json['portfolio_value'],
      firstAccess: json['first_access'],
      superAngel: json['super_angel'],
      portfolio: json['portfolio'] != null
          ? PortfolioModel.fromJson(json['portfolio'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['investor_name'] = name;
    data['email'] = email;
    data['city'] = city;
    data['country'] = country;
    data['balance'] = balance;
    data['photo'] = photo;
    data['portfolio_value'] = portfolioValue;
    data['first_access'] = firstAccess;
    data['super_angel'] = superAngel;
    if (portfolio != null) {
      data['portfolio'] = portfolio!.toJson();
    }
    return data;
  }
}
