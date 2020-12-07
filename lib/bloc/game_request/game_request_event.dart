part of 'game_request_bloc.dart';

@immutable
abstract class GameRequestEvent {}

class FetchCharacter extends GameRequestEvent{
  FetchCharacter();
}
