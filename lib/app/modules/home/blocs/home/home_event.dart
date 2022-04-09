part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class SearchChangedEvent extends HomeEvent {
  final String search;

  const SearchChangedEvent(this.search) : super();

  @override
  List<Object?> get props => [search];
}

class SearchSubmittedEvent extends HomeEvent {
  const SearchSubmittedEvent() : super();

  @override
  List<Object?> get props => [];
}
