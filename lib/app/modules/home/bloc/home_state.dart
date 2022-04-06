part of 'home_bloc.dart';

abstract class HomeState {
  final int value;

  const HomeState(this.value);
}

class HomeIdleState extends HomeState {
  const HomeIdleState({int value = 0}) : super(value);
}
