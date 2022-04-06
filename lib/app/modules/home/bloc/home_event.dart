part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {
  const HomeEvent();
}

class IncrementEvent extends HomeEvent {
  const IncrementEvent() : super();
}
