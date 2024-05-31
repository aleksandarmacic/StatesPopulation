import 'package:equatable/equatable.dart';

import '../data/model/StatePopulation.dart';

abstract class StatePopulationState extends Equatable {}

class StatePopulationInitialState extends StatePopulationState {
  @override
  List<Object> get props => [];
}

class StatePopulationLoadingState extends StatePopulationState {
  @override
  List<Object> get props => [];
}

class StatePopulationLoadedState extends StatePopulationState {
  List<StatePopulation> statePopulations;
  StatePopulationLoadedState({required this.statePopulations});
  @override
  List<Object> get props => [];
}

class StatePopulationErrorState extends StatePopulationState {
  String message;
  StatePopulationErrorState({required this.message});
  @override
  List<Object> get props => [];
}
