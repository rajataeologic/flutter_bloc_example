import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/PlayerListingBloc.dart';
import 'package:flutter_bloc_example/bloc/PlayerListingEvents.dart';
import 'package:flutter_bloc_example/data/RestRequest.dart';
import 'package:flutter_bloc_example/models/NationModel.dart';
import 'package:flutter_bloc_example/res/strings.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle),
      ),
      body: ListView(
        children: List.generate(nations.length, (index) {
          NationModel model = nations.elementAt(index);
          return Container(
              margin: EdgeInsets.only(bottom: 10),
              child: ListTile(
                onTap: () {
                  context
                      .read<PlayerListingBloc>()
                      .add(CountryClickEvent(nationModel: model));
                  Navigator.pushNamed(context, '/playerListing');
                },
                tileColor: Colors.amber,
                title: Text(model.nationName),
              ));
        }),
      ),
    );
  }
}
