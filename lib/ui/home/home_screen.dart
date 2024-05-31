import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states_population/bloc/state_population_bloc.dart';
import 'package:states_population/bloc/elements/state_population_list.dart';
import 'package:states_population/bloc/elements/error.dart';
import 'package:states_population/bloc/elements/loading.dart';
import 'package:states_population/config/values/colors.dart';

import '../../bloc/state_population_state.dart';
import '../../bloc/state_population_event.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StatePopulationBloc statePopulationBloc;

  @override
  void initState() {
    statePopulationBloc = BlocProvider.of<StatePopulationBloc>(context);
    statePopulationBloc.add(FetchStatePopulationEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
      ),
      body: BlocBuilder<StatePopulationBloc, StatePopulationState>(
        builder: (context, state) {
          if (state is StatePopulationInitialState) {
            return buildLoading();
          } else if (state is StatePopulationLoadingState) {
            return buildLoading();
          } else if (state is StatePopulationLoadedState) {
            return buildResultsList(state.statePopulations);
          } else if (state is StatePopulationErrorState) {
            return buildError(state.message);
          } else {
            return buildError(tr("error"));
          }
        },
      ),
    );
  }
}
