import 'package:bloc/bloc.dart';
import 'package:empresas_flutter/app/modules/auth/irepositories/iauth_repository.dart';
import 'package:empresas_flutter/app/shared/exceptions/generic_exception.dart';
import 'package:empresas_flutter/app/shared/models/investor_model.dart';
import 'package:empresas_flutter/app/shared/view_models/login_view_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final IAuthRepository _authRepository;

  LoginBloc(this._authRepository) : super(const LoginInitialState()) {
    on<OnChangeEmailEvent>(_onChangeEmail);
    on<OnChangePasswordEvent>(_onChangePassword);
    on<OnSubmitEvent>(_onSubmit);
  }

  void _onChangeEmail(OnChangeEmailEvent event, Emitter<LoginState> emit) {
    emit(LoginIdleState(
        login: state.login
            .copyWith(email: event.email, password: state.login.password)));
  }

  void _onChangePassword(
      OnChangePasswordEvent event, Emitter<LoginState> emit) {
    emit(LoginIdleState(
        login: state.login
            .copyWith(password: event.password, email: state.login.email)));
  }

  Future<void> _onSubmit(OnSubmitEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState(login: state.login));
    try {
      var investor = await _authRepository.login(state.login);

      emit(LoginSuccessState(investor: investor, login: state.login));
    } on GenericException catch (e) {
      emit(LoginErrorState(message: e.message, login: state.login));
    } catch (e) {
      emit(LoginErrorState(message: e.toString(), login: state.login));
    }
  }
}
