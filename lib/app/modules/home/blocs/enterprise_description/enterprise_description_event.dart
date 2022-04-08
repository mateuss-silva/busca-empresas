part of 'enterprise_description_bloc.dart';

abstract class EnterpriseDescriptionEvent extends Equatable {
  const EnterpriseDescriptionEvent();

  @override
  List<Object> get props => [];
}

class EnterpriseDescriptionInitialEvent extends EnterpriseDescriptionEvent {
  final EnterpriseModel enterprise;
  const EnterpriseDescriptionInitialEvent(this.enterprise);

  @override
  List<Object> get props => [enterprise];
}

class EnterpriseDescriptionFetchEvent extends EnterpriseDescriptionEvent {
  const EnterpriseDescriptionFetchEvent() : super();

  @override
  List<Object> get props => [];
}
