import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeIdleState()) {
    on<IncrementEvent>((event, emit) {
      emit(HomeIdleState(value: state.value + 1));
    });
  }
}
