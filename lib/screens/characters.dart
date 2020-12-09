import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:api_getdata/bloc/game_request/game_request_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class CharacterScreen extends StatefulWidget {
  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Valorant"),
        backgroundColor: Colors.red,
      ),
      body: BlocBuilder<GameRequestBloc, GameRequestState>(
        builder: (context, state) {
          if (state is GameRequestLoading) {
            return Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator());
          } else if (state is GameRequestFetch) {
            return Container(
                child: ListView.builder(
              itemCount:
                  state.valCharacters == null ? 0 : state.valCharacters.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                        child: Image.asset(
                            'assets/valorant/${state.valCharacters[index]["assetName"]}.png')),
                    SizedBox(height: 5),
                    Text("Characters : ${state.valCharacters[index]["name"]}",
                        style: TextStyle(color: Colors.white)),
                    SizedBox(height: 20)
                  ],
                );
              },
            ));
          }

          return Text("");
        },
      ),
      // floatingActionButton: MaterialButton(
      //       color: Colors.blueAccent,
      //       onPressed: () {
      //         BlocProvider.of<GameRequestBloc>(context).add(FetchCharacter());
      //       },
      //       child: Text(
      //         'Get Characters',
      //         style: TextStyle(color: Colors.white),
      //       ),
      //     ),
    );
  }
}
