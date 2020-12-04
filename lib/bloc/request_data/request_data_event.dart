part of 'request_data_bloc.dart';

@immutable
abstract class RequestDataEvent {}

class FetchData extends RequestDataEvent {
  FetchData();
}
