import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:states_population/data/model/StatePopulation.dart';

var url = "https://datausa.io/api/data?drilldowns=State&measures=Population&year=latest";

abstract class StatePopulationRepository {
  Future<List<StatePopulation>> getStatePopulations();
}

class StatePopulationRepositoryImpl extends StatePopulationRepository {
  @override
  Future<List<StatePopulation>> getStatePopulations() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> statePopulationsData = data["data"];

      List<StatePopulation> statePopulations = [];
      statePopulationsData.forEach(
        (statePopulation) {
          statePopulations.add(
            StatePopulation(
              state: statePopulation["State"],
              population: statePopulation["Population"],
            ),
          );
        },
      );
      return statePopulations;
    } else {
      throw Exception('Failed');
    }
  }
}
