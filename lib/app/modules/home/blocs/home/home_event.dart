part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class SearchChanged extends HomeEvent {
  final String search;

  const SearchChanged(this.search) : super();

  @override
  List<Object?> get props => [search];
}

class SearchSubmitted extends HomeEvent {
  const SearchSubmitted() : super();

  @override
  List<Object?> get props => [];
}
