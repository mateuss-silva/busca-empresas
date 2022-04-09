import 'package:bloc/bloc.dart';
import 'package:empresas_flutter/app/modules/home/irepositories/ienterprise_repository.dart';
import 'package:empresas_flutter/app/shared/exceptions/generic_exception.dart';
import 'package:empresas_flutter/app/shared/models/enterprise_model.dart';
import 'package:equatable/equatable.dart';

part 'enterprise_description_event.dart';
part 'enterprise_description_state.dart';

class EnterpriseDescriptionBloc
    extends Bloc<EnterpriseDescriptionEvent, EnterpriseDescriptionState> {
      
  final IEnterpriseRepository _enterpriseRepository;

  EnterpriseDescriptionBloc(this._enterpriseRepository)
      : super(const EnterpriseDescriptionInitialState()) {
    on<EnterpriseDescriptionInitialEvent>((event, emit) {
      emit(EnterpriseDescriptionIdleState(event.enterprise));
    });

    on<EnterpriseDescriptionFetchEvent>(_getEnterprise);
  }

  Future<void> _getEnterprise(EnterpriseDescriptionFetchEvent event,
      Emitter<EnterpriseDescriptionState> emit) async {
    emit(EnterpriseDescriptionLoadingState(state.enterprise!));

    try {
      final enterprise =
          await _enterpriseRepository.getEnterprise(state.enterprise!.id);

      emit(EnterpriseDescriptionSuccessState(enterprise));
    } on GenericException catch (e) {
      emit(EnterpriseDescriptionErrorState(
          message: e.message, enterprise: state.enterprise!));
    } catch (e) {
      emit(EnterpriseDescriptionErrorState(
          message: e.toString(), enterprise: state.enterprise!));
    }
  }
}
