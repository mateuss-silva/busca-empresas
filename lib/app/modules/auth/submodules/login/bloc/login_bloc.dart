import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginIdleState()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
