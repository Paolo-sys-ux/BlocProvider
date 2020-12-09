import 'package:api_getdata/bloc/game_request/game_request_bloc.dart';
import 'package:api_getdata/bloc/request_data/request_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Data"),
      ),
      body: BlocBuilder<RequestDataBloc, RequestDataState>(
        builder: (context, state) {
          if (state is RequestDataLoading) {
            return Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator());
          } else if (state is RequestDataFetch) {
            return Container(
              child: ListView.builder(
                itemCount: state.users == null ? 0 : state.users.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 3,
                    child: Column(
                      children: [
                        Text(
                          "${state.users[index]["id"]}",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          "${state.users[index]["email"]}",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          "${state.users[index]["first_name"]}",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          "${state.users[index]["last_name"]}",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }

          return Text('');
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MaterialButton(
            color: Colors.blueAccent,
            onPressed: () {
              BlocProvider.of<RequestDataBloc>(context).add(FetchData());
            },
            child: Text(
              'Get Data',
              style: TextStyle(color: Colors.white),
            ),
          ),
          MaterialButton(
            color: Colors.black,
            onPressed: (){
            BlocProvider.of<GameRequestBloc>(context).add(FetchCharacter());
                  Navigator.of(context).pushNamed('/character');
                }, child: Text("Valorant Characters", style: TextStyle(color: Colors.redAccent),))
        ],
      ),
    );
  }
}
