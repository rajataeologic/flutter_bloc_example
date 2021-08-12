import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/PlayerListingBloc.dart';
import 'package:flutter_bloc_example/bloc/PlayerListingState.dart';
import 'package:flutter_bloc_example/models/PlayerDataModel.dart';
import 'package:flutter_bloc_example/res/strings.dart';
import 'package:flutter_bloc_example/widgets/Message.dart';

class PlayerListingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Strings.PlayerListing),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            BlocBuilder(
                bloc: BlocProvider.of<PlayerListingBloc>(context),
                builder: (context, state) {
                  if (state is PlayerUnintializedState) {
                    return Message(
                        message: "Unintialized State");
                  } else if (state is EmptyState) {
                    return Message(message: "No Players found");
                  } else if (state is ErrorState) {
                    return Message(message: "Something went wrong");
                  } else if (state is FetchingState) {
                    return  Expanded(child: Center(child: CircularProgressIndicator()));
                  } else {
                    final stateAsPlayerFetchedState = state as FetchedState;
                    final players = stateAsPlayerFetchedState.playerList;
                    return buildPlayersList(players!);
                  }

                }),
          ],
        ),
      ),
    );
  }
  Widget buildPlayersList(List<Players> players) {
    return Expanded(
      child: ListView(children: List.generate(players.length, (index) {
        return ListTile(title: Text(players.elementAt(index).name!),);
      }),),
    );
  }

}
