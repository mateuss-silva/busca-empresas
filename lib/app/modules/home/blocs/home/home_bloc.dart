import 'package:bloc/bloc.dart';
import 'package:empresas_flutter/app/modules/home/irepositories/ienterprise_repository.dart';
import 'package:empresas_flutter/app/shared/exceptions/generic_exception.dart';
import 'package:empresas_flutter/app/shared/models/enterprise_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IEnterpriseRepository _enterpriseRepository;

  HomeBloc(this._enterpriseRepository) : super(const HomeInitialState()) {
    on<SearchChanged>((event, emit) => emit(
        HomeIdleState(search: event.search, enterprises: state.enterprises)));

    on<SearchSubmitted>(_getEnterprises);
  }

  Future<void> _getEnterprises(
      SearchSubmitted event, Emitter<HomeState> emit) async {
    emit(
        HomeLoadingState(enterprises: state.enterprises, search: state.search));

    try {
      final enterprises =
          await _enterpriseRepository.getCompanies(name: state.search);

      emit(HomeSuccessState(enterprises: enterprises, search: state.search));
    } on GenericException catch (e) {
      emit(HomeErrorState(
          message: e.message,
          enterprises: state.enterprises,
          search: state.search));
    } catch (e) {
      emit(HomeErrorState(
          message: e.toString(),
          enterprises: state.enterprises,
          search: state.search));
    }
  }
}
