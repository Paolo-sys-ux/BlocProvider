import 'dart:convert';

import 'package:api_getdata/screens/characters.dart';
import 'package:api_getdata/screens/home.dart';

import 'route.dart';
import 'package:api_getdata/bloc/request_data/request_data_bloc.dart';
import 'package:api_getdata/bloc/user_details/cubit/user_data_cubit.dart';
import 'package:api_getdata/bloc/user_details/user_details_bloc.dart';
import 'package:api_getdata/bloc/game_request/game_request_bloc.dart';
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
        BlocProvider<GameRequestBloc>(
            create: (BuildContext context) => GameRequestBloc())
      ],
      child: MaterialApp(
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: '/home',
        debugShowCheckedModeBanner: false,
        title: 'Get Data',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
