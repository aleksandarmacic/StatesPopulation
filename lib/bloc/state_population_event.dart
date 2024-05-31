import 'package:equatable/equatable.dart';

abstract class StatePopulationEvent extends Equatable {}

class FetchStatePopulationEvent extends StatePopulationEvent {
  @override
  List<Object> get props => [];
}
