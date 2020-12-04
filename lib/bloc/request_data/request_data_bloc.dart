import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'request_data_event.dart';
part 'request_data_state.dart';

class RequestDataBloc extends Bloc<RequestDataEvent, RequestDataState> {
  RequestDataBloc() : super(RequestDataInitial());

  @override
  Stream<RequestDataState> mapEventToState(
    RequestDataEvent event,
  ) async* {
    // TODO: implement mapEventToState

    if (event is FetchData) {
      yield RequestDataLoading(loadingMessage: 'Please wait..');

      var response = await http.get('https://reqres.in/api/users?page=2');

      var data = jsonDecode(response.body);

      yield RequestDataFetch(data["data"]);
      print(data["data"]);
    }
  }
}
