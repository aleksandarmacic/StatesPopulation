import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:states_population/config/values/colors.dart';
import 'package:states_population/config/values/constants.dart';
import 'package:states_population/data/model/StatePopulation.dart';

Widget buildResultsList(List<StatePopulation> statePopulations) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          tr("state_population_list"),
          style: TextStyle(
            color: statePopulationListTitleColor,
            fontSize: fontSize36,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: statePopulations.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: statePopulationListPadding, vertical: statePopulationListPadding/2),
              child: Card(
                child: SizedBox(
                  height: cardHeight,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        statePopulations[index].state.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize16),
                      ),
                      Text(
                        statePopulations[index].population.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize16),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}

