import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_example/models/NationModel.dart';

abstract class PlayerListingEvent {}

class CountryClickEvent extends PlayerListingEvent {
  final NationModel? nationModel;

  CountryClickEvent({@required this.nationModel});
}
