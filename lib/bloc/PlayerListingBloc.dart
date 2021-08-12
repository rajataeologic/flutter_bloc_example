import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/data/RestRequest.dart';
import 'package:flutter_bloc_example/models/NationModel.dart';
import 'package:flutter_bloc_example/models/PlayerDataModel.dart';

import 'PlayerListingEvents.dart';
import 'PlayerListingState.dart';

class PlayerListingBloc extends Bloc<PlayerListingEvent, PlayerListingState> {
  final RestRequest? playerRepository;

  PlayerListingBloc({this.playerRepository})
      : super(new PlayerUnintializedState());

  @override
  void onTransition(
      Transition<PlayerListingEvent, PlayerListingState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  PlayerListingState get initialState => PlayerUnintializedState();

  @override
  Stream<PlayerListingState> mapEventToState(PlayerListingEvent event) async* {
    yield FetchingState();
    List<Players>? players;
    try {
      if (event is CountryClickEvent) {
        print(event.nationModel!.countryId);
        players = await playerRepository!
            .fetchPlayersByCountry(event.nationModel!.countryId);
      }
      if (players!.length == 0) {
        yield EmptyState();
      } else {
        yield FetchedState(playerList: players);
      }
    } catch (e) {
      print(e);
      yield ErrorState();
    }
  }
}
