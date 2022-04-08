part of 'enterprise_description_bloc.dart';

abstract class EnterpriseDescriptionState extends Equatable {
  final EnterpriseModel? enterprise;

  const EnterpriseDescriptionState(this.enterprise);

  @override
  List<Object?> get props => [enterprise];
}

class EnterpriseDescriptionInitialState extends EnterpriseDescriptionState {
  const EnterpriseDescriptionInitialState() : super(null);

  @override
  List<Object?> get props => [enterprise];
}

class EnterpriseDescriptionLoadingState extends EnterpriseDescriptionState {
  const EnterpriseDescriptionLoadingState(EnterpriseModel enterprise)
      : super(enterprise);

  @override
  List<Object?> get props => [enterprise];
}

class EnterpriseDescriptionIdleState extends EnterpriseDescriptionState {
  const EnterpriseDescriptionIdleState(EnterpriseModel enterprise)
      : super(enterprise);

  @override
  List<Object?> get props => [enterprise];
}

class EnterpriseDescriptionErrorState extends EnterpriseDescriptionState {
  final String message;
  const EnterpriseDescriptionErrorState(
      {required this.message, required EnterpriseModel enterprise})
      : super(enterprise);

  @override
  List<Object?> get props => [message, enterprise];
}

class EnterpriseDescriptionSuccessState extends EnterpriseDescriptionState {
  const EnterpriseDescriptionSuccessState(EnterpriseModel enterprise)
      : super(enterprise);

  @override
  List<Object?> get props => [enterprise];
}
