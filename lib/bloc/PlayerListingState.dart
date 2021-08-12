import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_example/models/PlayerDataModel.dart';

abstract class PlayerListingState {}

class PlayerUnintializedState extends PlayerListingState{}
class FetchingState extends PlayerListingState{}
class FetchedState extends PlayerListingState{
  final List<Players> ? playerList;
  FetchedState({@required this.playerList});

}
class ErrorState extends PlayerListingState{}
class EmptyState extends PlayerListingState{}