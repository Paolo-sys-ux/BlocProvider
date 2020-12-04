part of 'request_data_bloc.dart';

@immutable
abstract class RequestDataState {}

class RequestDataInitial extends RequestDataState {}

class RequestDataLoading extends RequestDataState {
  final String loadingMessage;

  RequestDataLoading({this.loadingMessage});
}

class RequestDataFetch extends RequestDataState {
  final List users;

  RequestDataFetch(this.users);
}
