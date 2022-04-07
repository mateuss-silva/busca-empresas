import 'package:bloc/bloc.dart';
import 'package:empresas_flutter/app/modules/auth/irepositories/iauth_repository.dart';
import 'package:empresas_flutter/app/shared/models/investor_model.dart';
import 'package:empresas_flutter/app/shared/view_models/login_view_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final IAuthRepository _authRepository;

  LoginBloc(this._authRepository) : super(const LoginIdleState()) {
    on<OnChangeEmailEvent>(_onChangeEmail);
    on<OnChangePasswordEvent>(_onChangePassword);
    on<OnSubmitEvent>(_onSubmit);
  }

  void _onChangeEmail(OnChangeEmailEvent event, Emitter<LoginState> emit) {
    final state = this.state;

    if (state is LoginIdleState) {
      emit(LoginIdleState(login: state.login.copyWith(email: event.email)));
    }
  }

  void _onChangePassword(
      OnChangePasswordEvent event, Emitter<LoginState> emit) {
    final state = this.state;

    if (state is LoginIdleState) {
      emit(LoginIdleState(
          login: state.login.copyWith(password: event.password)));
    }
  }

  Future<void> _onSubmit(OnSubmitEvent event, Emitter<LoginState> emit) async {
    final state = this.state as LoginIdleState;
    emit(const LoginLoadingState());
    try {
      var investor = await _authRepository.login(state.login);

      emit(LoginSuccessState(investor));
    } catch (e) {
      emit(LoginErrorState(message: e.toString()));
      emit(LoginIdleState(login: state.login));
    }
  }
}
