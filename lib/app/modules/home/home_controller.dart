import 'package:empresas_flutter/app/modules/home/blocs/home/home_bloc.dart';
import 'package:empresas_flutter/app/modules/home/irepositories/ienterprise_repository.dart';
import 'package:empresas_flutter/app/shared/models/enterprise_model.dart';
import 'package:empresas_flutter/app/shared/models/investor_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeController extends Disposable {
  final IEnterpriseRepository _enterpriseRepository;
  final HomeBloc homeBloc;

  HomeController(this._enterpriseRepository, this.homeBloc) {
    homeBloc.add(const SearchSubmitted());
  }

  Stream<HomeState> get homeStream => homeBloc.stream;

  late InvestorModel investor;

  init(InvestorModel investor) {
    this.investor = investor;

    _enterpriseRepository.api.setUid(investor.authorization!.uid);
    _enterpriseRepository.api.setClient(investor.authorization!.client);
    _enterpriseRepository.api.setToken(investor.authorization!.accessToken);
  }

  void onChangeSearch(String value) => homeBloc.add(SearchChanged(value));

  Stream<HomeState> get enterprisesStream => homeBloc.stream;

  Future<List<EnterpriseModel>> onChangeSearchReturnSuggestion(String search) =>
      _enterpriseRepository.getCompanies(name: search);

  onSubmitSearch(String value) {
    homeBloc.add(const SearchSubmitted());
  }

  @override
  void dispose() {
    homeBloc.close();
  }
}
