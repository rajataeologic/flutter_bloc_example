import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/PlayerListingBloc.dart';
import 'package:flutter_bloc_example/data/RestRequest.dart';
import 'package:flutter_bloc_example/ui/HomePage.dart';
import 'package:flutter_bloc_example/ui/PlayerListingScreen.dart';

void main() {
  runApp(BlocProvider(create: (context)=>PlayerListingBloc(playerRepository: new RestRequest()),child: MyApp(),));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {'/':(context)=>HomePage(),'/playerListing':(context)=> PlayerListingScreen()},
    );
  }
}

