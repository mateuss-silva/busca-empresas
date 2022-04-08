import 'package:empresas_flutter/app/modules/home/blocs/home/home_bloc.dart';
import 'package:empresas_flutter/app/modules/home/irepositories/ienterprise_repository.dart';
import 'package:empresas_flutter/app/shared/models/enterprise_model.dart';
import 'package:empresas_flutter/app/shared/models/investor_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeController extends Disposable {
  final IEnterpriseRepository _enterpriseRepository;
  final HomeBloc _homeBloc;

  HomeController(this._enterpriseRepository, this._homeBloc) {
    _homeBloc.add(const SearchSubmitted());
  }

  late InvestorModel investor;

  init(InvestorModel investor) {
    this.investor = investor;

    // _enterpriseRepository.setUid()
  }

  void onChangeSearch(String value) => _homeBloc.add(SearchChanged(value));

  Stream<HomeState> get enterprisesStream => _homeBloc.stream;

  Future<List<EnterpriseModel>> onChangeSearchReturnSuggestion(String search) =>
      _enterpriseRepository.getCompanies(name: search);

  onSubmitSearch(String value) => _homeBloc.add(const SearchSubmitted());

  @override
  void dispose() {
    _homeBloc.close();
  }
}
