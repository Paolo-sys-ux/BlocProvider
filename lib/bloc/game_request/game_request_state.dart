part of 'game_request_bloc.dart';

@immutable
abstract class GameRequestState {}

class GameRequestInitial extends GameRequestState {}

class GameRequestLoading extends GameRequestState{
  final String loadingMessage;

  GameRequestLoading({this.loadingMessage});
}

class GameRequestFetch extends GameRequestState{
  final List valCharacters;

  GameRequestFetch(this.valCharacters);
}