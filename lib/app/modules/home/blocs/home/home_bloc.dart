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

  HomeBloc(this._enterpriseRepository) : super(const HomeIdleState()) {
    on<SearchChanged>(
        (event, emit) => emit(HomeIdleState(search: event.search)));

    on<SearchSubmitted>(_getEnterprises);
  }

  Future<void> _getEnterprises(
      SearchSubmitted event, Emitter<HomeState> emit) async {
    var state = this.state as HomeIdleState;

    emit(const HomeLoadingState());

    try {
      final enterprises =
          await _enterpriseRepository.getCompanies(name: state.search);

      emit(HomeIdleState(enterprises: enterprises, search: state.search));
    } on GenericException catch (e) {
      emit(HomeErrorState(e.message));
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }
}
