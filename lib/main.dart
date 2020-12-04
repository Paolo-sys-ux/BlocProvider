import 'dart:convert';

import 'package:api_getdata/bloc/request_data/request_data_bloc.dart';
import 'package:api_getdata/bloc/user_details/cubit/user_data_cubit.dart';
import 'package:api_getdata/bloc/user_details/user_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserDetailsBloc>(
          create: (BuildContext context) => UserDetailsBloc(),
        ),
        BlocProvider<UserDataCubit>(
          create: (BuildContext context) => UserDataCubit(),
        ),
        BlocProvider<RequestDataBloc>(
          create: (BuildContext context) => RequestDataBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Get Data',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'List of Data'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
      floatingActionButton: MaterialButton(
        color: Colors.blueAccent,
        onPressed: () {
          BlocProvider.of<RequestDataBloc>(context).add(FetchData());
        },
        child: Text(
          'Get Data',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
