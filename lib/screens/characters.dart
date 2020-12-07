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
      appBar: AppBar(
        title: Text("Valorant"),
      ),
      body: BlocBuilder<GameRequestBloc, GameRequestState>(
        builder: (context, state){
          if(state is GameRequestLoading){
            return Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator());
          }
          else if(state is GameRequestFetch){
            return Container(
              child: ListView.builder(itemCount: state.valCharacters == null ? 0 : state.valCharacters.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Image.asset('assets/valorant/${state.valCharacters[index]["assetName"]}.png'),
                    SizedBox(height:10),
                    Text("Characters : ${state.valCharacters[index]["name"]}"),
                  ],
                );
              },

              )
            );
          }

          return Text("");
        },
      ),
      floatingActionButton: MaterialButton(
            color: Colors.blueAccent,
            onPressed: () {
              BlocProvider.of<GameRequestBloc>(context).add(FetchCharacter());
            },
            child: Text(
              'Get Characters',
              style: TextStyle(color: Colors.white),
            ),
          ),
    );
  }
}