import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states_population/data/model/StatePopulation.dart';
import 'package:states_population/data/repositories/state_population_repository.dart';

import 'state_population_event.dart';
import 'state_population_state.dart';

class StatePopulationBloc
    extends Bloc<StatePopulationEvent, StatePopulationState> {
  StatePopulationRepository repository;

  StatePopulationBloc({required this.repository})
      : super(StatePopulationInitialState()) {
    on<FetchStatePopulationEvent>((event, emit) async {
      emit(StatePopulationLoadingState());
      try {
        List<StatePopulation> statePopulations =
            await repository.getStatePopulations();
        emit(StatePopulationLoadedState(statePopulations: statePopulations));
      } catch (e) {
        emit(StatePopulationErrorState(message: e.toString()));
      }
    });
  }

  StatePopulationState get initialState => StatePopulationInitialState();
}
