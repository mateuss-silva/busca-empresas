part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  final String search;
  final List<EnterpriseModel> enterprises;

  const HomeState({required this.search, required this.enterprises});

  @override
  List<Object?> get props => [search, enterprises];
}

class HomeInitialState extends HomeState {
  const HomeInitialState() : super(enterprises: const [], search: '');

  @override
  List<Object?> get props => [];
}

class HomeIdleState extends HomeState {
  const HomeIdleState(
      {required String search, required List<EnterpriseModel> enterprises})
      : super(search: search, enterprises: enterprises);

  @override
  List<Object?> get props => [search, enterprises];
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState({
    required List<EnterpriseModel> enterprises,
    required String search,
  }) : super(enterprises: enterprises, search: search);

  @override
  List<Object?> get props => [enterprises, search];
}

class HomeSuccessState extends HomeState {
  const HomeSuccessState({
    required List<EnterpriseModel> enterprises,
    required String search,
  }) : super(enterprises: enterprises, search: search);

  @override
  List<Object?> get props => [search, enterprises];
}

class HomeErrorState extends HomeState {
  final String message;

  const HomeErrorState({
    required this.message,
    required List<EnterpriseModel> enterprises,
    required String search,
  }) : super(enterprises: enterprises, search: search);

  @override
  List<Object?> get props => [message, search, enterprises];
}
