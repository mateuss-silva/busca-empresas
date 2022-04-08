part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeIdleState extends HomeState {
  final String search;
  final List<EnterpriseModel> enterprises;

  const HomeIdleState({
    this.enterprises = const [],
    this.search = '',
  }) : super();

  @override
  List<Object?> get props => [enterprises, search];
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState();

  @override
  List<Object?> get props => [];
}

class HomeErrorState extends HomeState {
  final String message;

  const HomeErrorState(this.message) : super();

  @override
  List<Object?> get props => [message];
}
