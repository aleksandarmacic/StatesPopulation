import 'dart:convert';

StatePopulation statePopulationFromJson(String str) => StatePopulation.fromJson(json.decode(str));

String statePopulationToJson(StatePopulation data) => json.encode(data.toJson());

class StatePopulation {
  StatePopulation({
    required this.state,
    required this.population,
  });

  String state;
  int population;

  factory StatePopulation.fromJson(Map<String, dynamic> json) => StatePopulation(
        state: json["State"],
        population: json["Population"],
      );

  Map<String, dynamic> toJson() => {
        "State": state,
        "Population": population,
      };
}
